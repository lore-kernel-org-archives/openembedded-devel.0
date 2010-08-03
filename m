Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OgEVk-0008GB-Aa for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 12:14:17 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OgEVe-0001P6-8p for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 12:14:10 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 12:14:10 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Aug 2010 12:14:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 03 Aug 2010 12:13:58 +0200
Message-ID: <i38q56$4hq$1@dough.gmane.org>
References: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
	<i30rie$8aq$1@dough.gmane.org> <i318p1$ec3$1@dough.gmane.org>
	<i31rhg$4a8$1@dough.gmane.org> <i363dm$17p$1@dough.gmane.org>
	<AANLkTinE0=x74yBxHsGCpRLFoQfDF+gHeuHFMG=D+rY_@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <AANLkTinE0=x74yBxHsGCpRLFoQfDF+gHeuHFMG=D+rY_@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/5][v4] Make multi-machine toolchains to co-exist (Alternate approach)
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
X-List-Received-Date: Tue, 03 Aug 2010 10:14:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Acked-by: Koen Kooi <k-kooi@ti.com>

If noone objects, can we get this in ASAP?



On 02-08-10 18:27, Khem Raj wrote:
> On Mon, Aug 2, 2010 at 2:33 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 31-07-10 20:54, Koen Kooi wrote:
>>>> On 31-07-10 15:34, Koen Kooi wrote:
>>>>> On 31-07-10 11:48, Koen Kooi wrote:
>>>>>> On 31-07-10 07:34, Khem Raj wrote:
>>>>>>> Hi
>>>>
>>>>>>> Following series of patches are for making multi-machine toolchains co-exist with
>>>>>>> new cross staging for toolchain.
>>>>
>>>>>>> It installs the toolchain in <native sysroot>/usr/${BASE_PACKAGE_ARCH}
>>>>>>> this way we can have multiple toolchains co-existing for different sub-arches and major arches too.
>>>>
>>>>>>> I have booted a native-sdk-image on qemuarm successfully. The build for
>>>>>>> beagleboard minimal image using different versions of toolchain went all fine too.
>>>>
>>>>>>> Please test these patches and if seem ok provide some ACKS/NACKS
>>>>
>>>>>> Khem, thanks for working on this!
>>>>
>>>>>> Firing of a build now :)
>>>>
>>>>> 'MACHINE=beagleboard bitbake ffmpeg samba mysql5 gstreamer-ti' completed
>>>>> succesfully, doing a 'MACHINE=hawkboard bitbake gtk+' now.
>>>>
>>>> And that seems to have worked as well. I have kicked of a huge
>>>> multimachine build on the 16core buildserver at work and will inspect
>>>> the results on monday. But so far it's looking really good.
> 
> The multimachine build finished as well. Before I ack this patch, are we
> going to match the OE layout to the one used in poky?
> 
>> I think the layout we have is nice because it still keeps the cross
>> bits somewhat
>> and lets relocatable class to fudge the rpath and we are in native sysroot.
>> and <sysroot>/usr/armv5te/bin looks a bit better than
>> <sysroot>/usr/bin/armv5te/bin
> 
> 
> regards,
> 
> Koen
>>
>>
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMV+vmMkyGM64RGpERAr53AJ9tDqQpQsYNI8ghsSZ/Jq6od6IilwCeJ9Cf
GEp6+dnTlLtFyDcANsrx6lo=
=dAXV
-----END PGP SIGNATURE-----



