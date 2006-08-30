Received: from [81.255.54.11] (helo=mx.laposte.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <c.romain@laposte.net>) id 1GIVRw-0004Xk-4d
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Aug 2006 21:10:08 +0200
Received: from [192.168.2.2] (86.201.6.191) by mx.laposte.net (7.2.060.1)
	(authenticated as c.romain)
	id 44F4DE1A000C27B2; Wed, 30 Aug 2006 21:07:56 +0200
Message-ID: <44F5D42E.5060505@laposte.net>
Date: Wed, 30 Aug 2006 20:08:46 +0200
From: cyril Romain <c.romain@laposte.net>
User-Agent: Mail/News 1.5 (X11/20060114)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
References: <20060828235951.GA16344@twibble.org>	<20060829004122.GA22529@twibble.org>
	<44F54AA0.9050901@dominion.kabel.utwente.nl>
In-Reply-To: <44F54AA0.9050901@dominion.kabel.utwente.nl>
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: patcher changes - quilt patching breakage?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Aug 2006 19:10:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Jamie Lenehan schreef:
>   
>> On Tue, Aug 29, 2006 at 09:59:51AM +1000, Jamie Lenehan wrote:
>>     
>>> I've got huge amounts of breakage from quilt due to the patching
>>> related changs. Is anyone else seeing this. It looks like I can't
>>> apply any patches more than one.. which is rather wierd.
>>>       
>> The problem is that my build directory is:
>>
>>  /data/oe/build/titan-glibc-24
>>
>> and I have a directory called:
>>
>>  /data/oe/patches
>>
>> It appears that quilt searches throught he path for a directory
>> called "patches" and uses that for all it's patches. So the patches
>> are being stored in my /data/oe/patches directory instead of in the
>> package itself.
>>
>> The patch command used to mkdir the patches directory, but this is no
>> longer happening. The following patch appears to make things work
>> again - does this look correct to people who understand this patch
>> class?
>>     
>
> That patch isn't quite right yet, consider this recipe:
>
> - --------
> MAINTAINER = "Koen Kooi <koen@linuxtogo.org>"
> PV = ${DISTRO_VERSION}
>
> do_compile() {
>         mkdir -p ${D}${sysconfdir}
>         echo "Angstrom ${DISTRO_VERSION}" > ${D}${sysconfdir}/angstrom-version
>
> }
> - ---------
>
>
> that blows up. Does python have an os.mkdirhier?
>
>   
For that, python has os.makedirs(dir)

*makedirs*( 	path[, mode])

    Recursive directory creation function. Like mkdir(), but makes all
    intermediate-level directories needed to contain the leaf directory.
    Throws an error exception if the leaf directory already exists or
    cannot be created. The default mode is |0777| (octal). On some
    systems, mode is ignored. Where it is used, the current umask value
    is first masked out. *Note:* makedirs() will become confused if the
    path elements to create include os.pardir. New in version 1.5.2.
    Changed in version 2.3: This function now handles UNC paths correctly.

You you may also use bb.mkdirhier(dir)
____
def mkdirhier(dir):
    """Create a directory like 'mkdir -p', but does not complain if
    directory already exists like os.makedirs
    """

    debug(3, "mkdirhier(%s)" % dir)
    try:
        os.makedirs(dir)
        debug(2, "created " + dir)
    except OSError, e:
        if e.errno != 17: raise e
____


Regards,

  Cyril


