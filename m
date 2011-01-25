Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PhjII-0000we-EI for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 14:50:50 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PhjHZ-0005hc-0U for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 14:50:05 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 14:50:04 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 14:50:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 25 Jan 2011 14:41:42 +0100
Message-ID: <ihmjum$vdq$2@dough.gmane.org>
References: <1295464913-2642-1-git-send-email-koen@openembedded.org>
	<4D373CFC.8010400@balister.org> 
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D373CFC.8010400@balister.org> 
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] insane bbclass: extend RPATH check to cover sysroots as well
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
X-List-Received-Date: Tue, 25 Jan 2011 13:50:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-01-11 08:10, Koen Kooi wrote:
> On 19-01-11 20:35, Philip Balister wrote:
>> On 01/19/2011 11:21 AM, Koen Kooi wrote:
>>> * Having rpath to sysroot is just as bad as one to workdir
> 
>> When you do a build with this, how many recipes have issues?
> 
> Console-image is clean now :)

And angstrom-gnome-image as well, so can I get some Acks or tested-bys
please?

> 
> 
>> Philip
> 
> 
>>>
>>> Based on insane.bbclass from yocto
>>>
>>> Signed-off-by: Koen Kooi<koen@openembedded.org>
>>> ---
>>>   classes/insane.bbclass |   11 ++++++-----
>>>   1 files changed, 6 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/classes/insane.bbclass b/classes/insane.bbclass
>>> index 677db27..50752b5 100644
>>> --- a/classes/insane.bbclass
>>> +++ b/classes/insane.bbclass
>>> @@ -160,20 +160,21 @@ def package_qa_check_rpath(file,name,d, elf):
>>>       import bb, os
>>>       sane = True
>>>       scanelf =
>>> os.path.join(bb.data.getVar('STAGING_BINDIR_NATIVE',d,True),'scanelf')
>>> -    bad_dir = bb.data.getVar('TMPDIR', d, True) + "/work"
>>> +    bad_dirs = [bb.data.getVar('TMPDIR', d, True) + "/work",
>>> bb.data.getVar('STAGING_DIR_TARGET', d, True)]
>>>       bad_dir_test = bb.data.getVar('TMPDIR', d, True)
>>>       if not os.path.exists(scanelf):
>>>           bb.fatal("Can not check RPATH, scanelf (part of
>>> pax-utils-native) not found")
>>>
>>> -    if not bad_dir in bb.data.getVar('WORKDIR', d, True):
>>> +    if not bad_dirs[0] in bb.data.getVar('WORKDIR', d, True):
>>>           bb.fatal("This class assumed that WORKDIR is
>>> ${TMPDIR}/work... Not doing any check")
>>>
>>>       output = os.popen("%s -B -F%%r#F '%s'" % (scanelf,file))
>>>       txt    = output.readline().split()
>>>       for line in txt:
>>> -        if bad_dir in line:
>>> -            error_msg = "package %s contains bad RPATH %s in file %s"
>>> % (name, line, file)
>>> -            sane = package_qa_handle_error(1, error_msg, name, file, d)
>>> +        for dir in bad_dirs:
>>> +            if dir in line:
>>> +                error_msg = "package %s contains bad RPATH %s in file
>>> %s" % (name, line, file)
>>> +                sane = sane + package_qa_handle_error(1, error_msg,
>>> name, file, d)
>>>
>>>       return sane
>>>
> 
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNPtMWMkyGM64RGpERAoWvAKC2+GgE7rmeUXUClmBBlAx5WB1dNgCgjGlf
IkvPXdAoZ6J072F/YSctiyE=
=Pndr
-----END PGP SIGNATURE-----



