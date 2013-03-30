Received: from smtp-out12.han.skanova.net ([195.67.226.212])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <openembedded@emagii.com>) id 1UM3AX-0001cy-Hx
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Mar 2013 22:18:33 +0100
Received: from [10.175.196.242] (83.227.56.237) by smtp-out12.han.skanova.net
	(8.5.133) (authenticated as u82406562)
	id 5140710C0048B039; Sat, 30 Mar 2013 22:01:24 +0100
Message-ID: <515752A4.3040107@emagii.com>
Date: Sat, 30 Mar 2013 22:01:24 +0100
From: Ulf Samuelsson <openembedded@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <5156DB73.4040507@emagii.com> <7185981.fYmuEdii30@helios>
In-Reply-To: <7185981.fYmuEdii30@helios>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Finding out the IMAGE_BASENAME of the image beeing built
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Mar 2013 21:18:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-03-30 15:13, Paul Eggleton wrote:
> On Saturday 30 March 2013 13:32:51 Ulf Samuelsson wrote:
>> Trying create a programming script recipe and need to find out the
>> IMAGE_BASENAME of the bitbake target
>> so I can get the filename of the image
>>
>> ${MACHINE}-${IMAGE_BASENAME}.ubi
>>
>> I.E: if I do
>>
>> $ MACHINE=beagleboard  bitbake some-image
>>
>> and "some-image_1.0.bb" contains
>>
>> IMAGE_BASENAME = "renamed-image"
>>
>> Then the resulting image will be
>>
>>       "beagleboard-renamed-image.ubi"
>>
>> How get this info from another recipe?
> You can't. The way to handle this is as part of do_rootfs itself (e.g. from a
> script called from ROOTFS_POSTPROCESS_COMMAND or IMAGE_POSTPROCESS_COMMAND).
>
> Cheers,
> Paul
>
OK, thanks

I tried to define  "configure-sam-ba.bbclass" which is inherited by my 
image.

configure-sam-ba.bbclass:
----------------------------------------------------------------------------------------------------------

SCRIPTFILE_TEMPLATE    = "${DEPLOY_DIR_IMAGE}/scripts/${MACHINE}.tcl"
SCRIPTFILE                      = 
"${DEPLOY_DIR_IMAGE}/scripts/${IMAGE_LINK_NAME}-${MACHINE}.tcl"
PROGFILE_TEMPLATE      = "${DEPLOY_DIR_IMAGE}/scripts/prog.sh"
PROGFILE                        = 
"${DEPLOY_DIR_IMAGE}/scripts/prog-${IMAGE_LINK_NAME}-${MACHINE}.sh"

sam-ba_setup () {

     if [ -e  ${PROGFILE_TEMPLATE} ] ; then
         sed    -i    s/#MACHINE#/${MACHINE}/ ${PROGFILE_TEMPLATE}
         sed    -i    s/#IMAGE#/${IMAGE_LINK_NAME}/ ${PROGFILE_TEMPLATE}
     fi
     cp    ${PROGFILE_TEMPLATE}    ${PROGFILE}

     if [ -e  ${SCRIPTFILE_TEMPLATE} ] ; then
         sed    -i    s/rootfs.ubi/${IMAGE_LINK_NAME}-${MACHINE}/ 
${SCRIPTFILE_TEMPLATE}
     fi
     cp    ${SCRIPTFILE_TEMPLATE}    ${SCRIPTFILE}
}

EXPORT_FUNCTIONS sam-ba_setup

EXTRA_IMAGEDEPENDS_append_mymachine = ' sam-ba'
IMAGE_POSTPROCESS_COMMAND_append_mymachine = " sam-ba_setup; "
----------------------------------------------------------------------------------------------------------
myimage.bb: contains.

inherit configure-sam-ba
----------------------------
It appears that the "configure-sam-ba.bbclass" file is found.
If I change the filename in the inherit statement I get an error message.

inherit configure-sam-ba-x
I get an error message.

Another indication is that the call to "sam-ba_setup;"  is inserted in 
the "run.do_rootfs.*" script,
but the script does not contain the "sam-ba_setup" subroutine.

In some places IMAGE_POSTPROCESS_COMMAND contains " 
rootfs_update_timestamp ",
from image.bbclass which *is* included in the "run.do_rootfs.*" script.

Should you not be able to use commands from a bbclass as 
PRE/POSTPROCESS_COMMAND?

A standard shell command will work, but since I need a number of 
commands, it seems
cleaner to implement it in a bbclass file.
This is my first bbclass file, so there may be things, I don't understand...


BR
Ulf Samuelsson





