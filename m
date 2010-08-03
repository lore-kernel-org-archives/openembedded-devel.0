Received: from smtp-out10.tpgi.com.au ([220.244.226.120]
	helo=mail10.tpgi.com.au) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marc@cpdesign.com.au>) id 1OgC6r-0002aB-Ac
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Aug 2010 09:40:28 +0200
X-TPG-Junk-Checked: Yes
X-TPG-Junk-Status: Message not scanned because user authenticated using SMTP
	AUTH
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=220-244-174-13.static.tpgi.com.au; ip=220.244.174.13;
	date=Tue, 3 Aug 2010 17:22:47 +1000;
	auth=jN+vu9lIznpdsLAI8D8JiNICYhl1zChPtcoQj/CnROE=
Received: from dev1.localnet (220-244-174-13.static.tpgi.com.au
	[220.244.174.13]) (authenticated bits=0)
	by mail10.tpgi.com.au (envelope-from marc@cpdesign.com.au)
	(8.14.3/8.14.3) with ESMTP id o737MjLq020069
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Aug 2010 17:22:47 +1000
From: Marc Reilly <marc@cpdesign.com.au>
Organization: Creative Product Designs
To: openembedded-devel@lists.openembedded.org
Date: Tue, 3 Aug 2010 17:22:39 +1000
User-Agent: KMail/1.13.5 (Linux/2.6.31.12-0.2-desktop; KDE/4.4.4; x86_64; ; )
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5ADD@deimsg40.de.net.world>
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA5018B5ADD@deimsg40.de.net.world>
MIME-Version: 1.0
Message-Id: <201008031722.39507.marc@cpdesign.com.au>
X-SA-Exim-Connect-IP: 220.244.226.120
X-SA-Exim-Mail-From: marc@cpdesign.com.au
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Problems building gdb-cross-sdk
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
X-List-Received-Date: Tue, 03 Aug 2010 07:40:28 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday, August 02, 2010 11:06:16 pm Hauser, Wolfgang (external) wrote:
> Hello,
> 
> I am running in strange problems while building gdb-cross-sdk.

snip

>   File "relocatable_binaries_preprocess", line 4, in <module>
>   File "relocatable_binaries_preprocess", line 2, in
> relocatable_binaries_preprocess
>   File "<bb>", line 7, in rpath_replace
>   File "<bb>", line 33, in process_dir
> OSError: [Errno 1] Operation not permitted:
> '//usr/local/angstrom/arm/bin/arm-angstrom-linux-gnueabi-nm'
> <<<<<
> 
> the production VM is drived from the test VM, so the used environment is
> mostly the same.
> 
> The python routine obviously loose or mangle the ${SYSROOT_DESTDIR} and
> ${STAGING_DIR_TARGET} Variable, but I can't figure out why.

I had the same problems the other day. SYSROOT_DESTDIR was empty and so OE was 
trying to work on the files that were already in place. (which fails due to 
permission probs.)

 
> Instead of '//usr/local/angstrom/arm/bin/arm-angstrom-linux-gnueabi-nm'
> it should be something  like
> '/angstrom/temp/angstrom-omap3evm/work/i686-armv7a-sdk-angstrom-linux-gn
> ueabi/gdb-cross-sdk-7.1-r6.0/temp' I suppose.
> 
> Has someone an idea what's going on ?
Sadly, I'm too new to all this. So I don't.

As a work around you can delete the existing toolchain installed at 
/usr/local/angstrom/..... The build finishes, but I don't know what the 
fallout is..  

(I did notice that a note that said this recipe uses legacy staging, but I'm 
not really sure what that means. Could that be something?)

Cheers
Marc






