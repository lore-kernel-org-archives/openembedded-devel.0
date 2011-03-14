Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>)
	id 1PzBBX-0007XN-IY; Mon, 14 Mar 2011 18:03:59 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PzB9u-00060C-F3 from Tom_Rini@mentor.com ;
	Mon, 14 Mar 2011 10:02:18 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 14 Mar 2011 10:02:07 -0700
Received: from [172.30.80.14] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 14 Mar 2011 10:02:17 -0700
Message-ID: <4D7E4A0A.2000805@mentor.com>
Date: Mon, 14 Mar 2011 10:02:02 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Ben Gardiner <bengardiner@nanometrics.ca>
References: <1300111886-4102-1-git-send-email-bengardiner@nanometrics.ca>	<4D7E3BB2.6060104@mentor.com>
	<AANLkTiknm8aEyOyS5jt237F6-PZrjCm9wJZKvWFYii6s@mail.gmail.com>
In-Reply-To: <AANLkTiknm8aEyOyS5jt237F6-PZrjCm9wJZKvWFYii6s@mail.gmail.com>
X-OriginalArrivalTime: 14 Mar 2011 17:02:07.0630 (UTC)
	FILETIME=[8D1072E0:01CBE269]
Cc: Koen Kooi <koen@openembedded.org>, Tom Rini <trini@embeddedalley.com>,
	Denys, arago-devel@gforge.ti.com, openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf : make IMAGE_CMD_ubifs also produce .rootfs.ubifs
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
X-List-Received-Date: Mon, 14 Mar 2011 17:03:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2011 09:26 AM, Ben Gardiner wrote:
> Hi Tom,
>
> Thanks for the rapid reply.
>
> On Mon, Mar 14, 2011 at 12:00 PM, Tom Rini<tom_rini@mentor.com>  wrote:
>>
>> On 03/14/2011 07:11 AM, Ben Gardiner wrote:
>>>
>>> The ubifs image filenames produced by the ubi and ubifs commands differ.
>>>
>>> IMAGE_CMD_ubi produces an interim ubifs image
>>> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ; whereas IMAGE_CMD_ubifs
>>> produces a final ubifs image
>>> ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.ubifs.img
>>>
>>> This results in the undesirable behaviour then when a user specifies
>>> IMAGE_FSTYPES contains ubifs (as opposed to ubi) they get a broken link
>>> ${DEPLOY_DIR_IMAGE}/${ROOTFS_IMAGE}-${MACHINE}.ubifs pointing to the
>>> non-existant ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs
>>>
>>> Fix the discrepancy by making the IMAGE_CMD_ubifs also produce the
>>> .rootfs.ubifs target like the IMAGE_CMD_ubi does and preserve the old
>>> .ubifs.img filename as a link for backwards compatibility.
>>
>> So, wait.  What's the problem here?  If you do IMAGE_FSTYPES="ubifs" you get the interim image which isn't useful normally but is
>> useful if you're doing volume management outside of the provided build targets. It's not however a valid rootfs target since it can't be
>> used as is.  I think what's missing here is just a comment to the effect that most people do not want 'ubifs' and they do want 'ubi' as
>> we provide ubifs for advanced usages.
>
> The other way around: If I do IMAGE_FSTYPES="ubifs" then I don't get
> the interim .rootfs.ubifs image I get instead a .ubifs.img; the
> .ubifs.img extension is different than the extensions produced by the
> other IMAGE_CMD's.

Right.  The others are a valid rootfs but the ubi isn't because it needs 
that container.

>
> I agree that  they are all valid rootfs images -- what is a difficulty
> for me is the resulting filename. The symlink 'sugar' provided by
> bitbake in ${DEPLOY_DIR_IMAGE} points to broken images: it always
> expects the .rootfs.<type>  extension.
>
> All other IMAGE_CMD's produce .rootfs.<type>, excecpt for
> IMAGE_CMD_UBIFS, which produces .ubifs.img

Would it be OK if we just didn't make the broken link, assuming we make 
the full use case work?

>>> Signed-off-by: Ben Gardiner<bengardiner@nanometrics.ca>
>>> CC: Tom Rini<trini@embeddedalley.com>
>>> CC: Koen Kooi<koen@openembedded.org>
>>> CC: Denys Dmytriyenko<denis@denix.org>
>>>
>>> ---
>>>
>>> Please also consider this patch for inclusion into the 2011.03-maintenance
>>> branch and into arago-oe-dev
>>
>> Just as a general comment, I don't want combined requests for 2011.03-maintenance but do feel free to make the request as soon
>> as it hits a mainline tree (and you've done the relevant testing on 2011.03-maintenance).
>
> My apologies -- it won't happen again.
>
>>> The reason I want to be able to address the ubifs image -- and
>>> not the UBI image -- is because I am trying to produce a UBI image from a
>>> a different ubinize config file which will contain both rootfs and
>>> kernel volumes.
>>>
>>> I am trying to accomplish this by creating a recipe which depends on the
>>> rootfs and kernel images we use. This recipe needs to synthesize the image
>>> file path, but without this patch it isn't simple since the link
>>> ${DEPLOY_DIR_IMAGE}/${ROOTFS_IMAGE}-${MACHINE}.ubifs is broken.
>>
>> So, this is a valid use case (which I was spelling out above, before I got down here). but I think you're using the wrong variables.>  There should be something that maps over to ${IMAGE_NAME}.ubifs.img
>
> You nailed the use case. :)
>
> There are additional complications (to me) introduced by the fact that
> the full image filename produced by bitbake has the 'ipk' stuff in it
> as well so it isn't as simple as synthesizing with .ubifs.img on the
> end.
>
> If you are still opposed to the proposed change; i.e. normalizing
> IMAGE_CMD_ubifs so that it produces .rootfs.ubifs instead of
> .ubifs.img. Could I request your help to suggest how I would
> synthesize the following image name:
> arago-base-image-glibc-ipk-2010.03-da850-omapl138-evm.ubifs.img

I've got an idea or two, but can you give me the full bitbake -e (off 
list of course) on the recipe that puts it all together?  We need for 
this use case to work and I just want to try and make it users that 
'ubifs' is special (and avoid the "I put IMAGES_FSTYPES+=ubifs into my 
local.conf, wrote it to flash and it doesn't work!" emails, but maybe 
that concern is just in my head at this point as UBI isn't as new as it 
used to be).

-- 
Tom Rini
Mentor Graphics Corporation


