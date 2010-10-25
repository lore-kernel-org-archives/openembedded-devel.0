Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PAM9R-0000E8-7U
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 14:28:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 5F2D8314A1F3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:27:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ovLR7Td-NpTx
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:26:56 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id DC9B2314A1E2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 14:26:55 +0200 (CEST)
Message-ID: <4CC5778F.7060004@opendreambox.org>
Date: Mon, 25 Oct 2010 14:26:55 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.14) Gecko/20101006 Thunderbird/3.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1286535392-1111-2-git-send-email-obi@opendreambox.org>	<1287320407-17965-1-git-send-email-obi@opendreambox.org>
	<AANLkTi=MSOpzgm+F5sidHjx0YByNLb2ZNCDsALViWfOQ@mail.gmail.com>
In-Reply-To: <AANLkTi=MSOpzgm+F5sidHjx0YByNLb2ZNCDsALViWfOQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] libdvdnav: add recipe for version 4.1.3-7 from debian
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
X-List-Received-Date: Mon, 25 Oct 2010 12:28:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/24/2010 01:52 PM, Frans Meulenbroeks wrote:
> 2010/10/17 Andreas Oberritter <obi@opendreambox.org>:
>> * v2: inherit lib_package before binconfig
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  ...-dvdnavmini.pc-link-against-libdvdnavmini.patch |   25 ++++++++++++++++++++
>>  recipes/libdvdnav/libdvdnav_4.1.3-7.bb             |    5 ++++
>>  recipes/libdvdnav/libdvdnav_git.inc                |   24 +++++++++++++++++++
>>  3 files changed, 54 insertions(+), 0 deletions(-)
>>  create mode 100644 recipes/libdvdnav/files/0001-dvdnavmini.pc-link-against-libdvdnavmini.patch
>>  create mode 100644 recipes/libdvdnav/libdvdnav_4.1.3-7.bb
>>  create mode 100644 recipes/libdvdnav/libdvdnav_git.inc
>>
>> diff --git a/recipes/libdvdnav/files/0001-dvdnavmini.pc-link-against-libdvdnavmini.patch b/recipes/libdvdnav/files/0001-dvdnavmini.pc-link-against-libdvdnavmini.patch
>> new file mode 100644
>> index 0000000..84ce442
>> --- /dev/null
>> +++ b/recipes/libdvdnav/files/0001-dvdnavmini.pc-link-against-libdvdnavmini.patch
>> @@ -0,0 +1,25 @@
>> +upstream: Daniel Baumann <daniel@debian.org>
>> +status: pending
>> +
>> +From 2329cd28d7508f9809f849fa547362aa7df160ba Mon Sep 17 00:00:00 2001
>> +From: Andreas Oberritter <obi@opendreambox.org>
>> +Date: Fri, 8 Oct 2010 00:50:54 +0000
>> +Subject: [PATCH] dvdnavmini.pc: link against libdvdnavmini
>> +
>> +---
>> + misc/dvdnavmini.pc.in |    2 +-
>> + 1 files changed, 1 insertions(+), 1 deletions(-)
>> +
>> +diff --git a/misc/dvdnavmini.pc.in b/misc/dvdnavmini.pc.in
>> +index 52945b3..773be2f 100644
>> +--- a/misc/dvdnavmini.pc.in
>> ++++ b/misc/dvdnavmini.pc.in
>> +@@ -8,4 +8,4 @@ Description: DVD Navigation mini library
>> + Version: @VERSION@
>> +
>> + Cflags: -I${includedir} @DVDREAD_CFLAGS@ @THREAD_CFLAGS@
>> +-Libs: -L${libdir} -ldvdnav @THREAD_LIBS@
>> ++Libs: -L${libdir} -ldvdnavmini @THREAD_LIBS@
> 
> Is this not better done with CFLAGS and LDFLAGS ?
> (personally I prefer using CFLAGS above a patch, as it is less likely
> to break if you move to a newer version).

I don't understand what you mean here. libdvdnavmini is part of this
package and this is the template for the .pc file, which gets installed
by the -dev package. It's a bug in upstream code and the patch has been
submitted to the maintainer.

>> +--
>> +1.7.1
>> +
>> diff --git a/recipes/libdvdnav/libdvdnav_4.1.3-7.bb b/recipes/libdvdnav/libdvdnav_4.1.3-7.bb
>> new file mode 100644
>> index 0000000..b1d75ad
>> --- /dev/null
>> +++ b/recipes/libdvdnav/libdvdnav_4.1.3-7.bb
>> @@ -0,0 +1,5 @@
>> +require libdvdnav_git.inc
> 
> I feel that in general  an inc file should not have any version info
> in the name. It is supposed to to be for multiple versions,
> exception could be if an inc file is to share info between e.g. native
> cross target sdk versions (like e.g. for gcc).
> 
> Since there is only one recipe using it, I'd suggest inlining the inc file.
> Otherwise if you feel keeping the inc is useful, rename the file to
> libdvdnav.inc

OK.

>> +
>> +SRC_URI += "file://0001-dvdnavmini.pc-link-against-libdvdnavmini.patch"
>> +
>> +SRCREV = "850e513d4fea29b40879378b13003cd677e5214b"
>> diff --git a/recipes/libdvdnav/libdvdnav_git.inc b/recipes/libdvdnav/libdvdnav_git.inc
>> new file mode 100644
>> index 0000000..242f765
>> --- /dev/null
>> +++ b/recipes/libdvdnav/libdvdnav_git.inc
>> @@ -0,0 +1,24 @@
>> +DESCRIPTION = "DVD navigation multimeda library"
>> +SECTION = "libs/multimedia"
>> +LICENSE = "GPL"
> 
> v2+ ?

Yes.

I'll send updated patches for both libdvdread and libdvdnav shortly

Thanks,
Andreas


