Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 295876C42D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 06:50:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAK6o8HT000930
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Nov 2018 22:50:29 -0800
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 19 Nov 2018 22:50:11 -0800
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <1542002391-62018-1-git-send-email-changqing.li@windriver.com>
	<896c9962-2e7b-9ede-272e-2d6751ddb491@gmail.com>
	<eb5a64ca-614f-bf81-5e80-6ac9d790ddf6@windriver.com>
	<CA+chaQfVj1-0dfffh_D+ZHLrZmhwQrzNR_2JMQjDE3S_LWwdvA@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <f481bf15-d2f9-77c5-7357-8b795963b591@windriver.com>
Date: Tue, 20 Nov 2018 14:50:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQfVj1-0dfffh_D+ZHLrZmhwQrzNR_2JMQjDE3S_LWwdvA@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] geoip: update GeoLite Database checksum
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Nov 2018 06:50:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 11/16/18 5:17 PM, Martin Jansa wrote:
> Can you please add downloadfilename parameter adding some suffix to 
> the downloaded archive (e.g. the date when the checksums were updated 
> in the recipe), so that they don't conflict on MIRRORS and PREMIRRORS?
>
> Because changing only the checksum won't cause the archive to be 
> re-downloaded if it was already fetched before and if there is "old" 
> archive on some PREMIRROR then it will continue to fetch this one 
> instead the new one from upstream.
>
> Even with downloadfilename set in the recipe it will require everybody 
> to delete old archives from all their PREMIRRORs and local downloads 
> directories, but at least for next time they will use different 
> filename each time.

@Martin and Khem,  I have send a patch just now to fix according to 
above comments, please

help to review it, thanks.


//changqing

>
> On Fri, Nov 16, 2018 at 4:09 AM Changqing Li 
> <changqing.li@windriver.com <mailto:changqing.li@windriver.com>> wrote:
>
>
>     On 11/16/18 5:35 AM, akuster808 wrote:
>     >
>     > On 11/11/18 9:59 PM, changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com> wrote:
>     >> From: Changqing Li <changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com>>
>     >>
>     >> GeoLite Database checksum changed again recently, so
>     >> update it.
>     >>
>     >> Signed-off-by: Changqing Li <changqing.li@windriver.com
>     <mailto:changqing.li@windriver.com>>
>     >> ---
>     >>   meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>     <http://geoip_1.6.12.bb> | 8 ++++----
>     >>   1 file changed, 4 insertions(+), 4 deletions(-)
>     >>
>     >> diff --git
>     a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>     <http://geoip_1.6.12.bb>
>     b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>     <http://geoip_1.6.12.bb>
>     >> index 0657369..1e1a7ff 100644
>     >> --- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>     <http://geoip_1.6.12.bb>
>     >> +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
>     <http://geoip_1.6.12.bb>
>     >> @@ -20,14 +20,14 @@ SRCREV =
>     "4b526e7331ca1d692b74a0509ddcc725622ed31a"
>     >>   SRC_URI[GeoIP-dat.md5sum] = "d538e57ad9268fdc7955c6cf9a37c4a9"
>     >>   SRC_URI[GeoIP-dat.sha256sum] =
>     "b9c05eb8bfcf90a6ddfdc6815caf40a8db2710f0ce3dd48fbd6c24d485ae0449"
>     >>
>     >> -SRC_URI[GeoIPv6-dat.md5sum] = "a685e71ab129b6ca4cba75f7eaeb5335"
>     >> -SRC_URI[GeoIPv6-dat.sha256sum] =
>     "a94398430701c8458fedbd20aa2a5d460858441f2ca495f32621f6d16154171f"
>     >> +SRC_URI[GeoIPv6-dat.md5sum] = "00dc3b3f53eb5f7bf6915f939998f12c"
>     >> +SRC_URI[GeoIPv6-dat.sha256sum] =
>     "e72221fc630094d7256521b307e9142fb77d2167a27de2c11da536a2ba1d1480"
>     >>
>     >>   SRC_URI[GeoLiteCity-dat.md5sum] =
>     "d700c137232f8e077ac8db8577f699d9"
>     >>   SRC_URI[GeoLiteCity-dat.sha256sum] =
>     "90db2e52195e3d1bcdb2c2789209006d09de5c742812dbd9a1b36c12675ec4cd"
>     >>
>     >> -SRC_URI[GeoLiteCityv6-dat.md5sum] =
>     "f6dff70c99f8449af1b7a33073eaa743"
>     >> -SRC_URI[GeoLiteCityv6-dat.sha256sum] =
>     "8b6f065ed68bed2a03d61b8d6c7e2f1c52ebd00c0d4a00f6cdc04195c03e32e3"
>     >> +SRC_URI[GeoLiteCityv6-dat.md5sum] =
>     "7f6333d433d8127181ea3c5828287c98"
>     >> +SRC_URI[GeoLiteCityv6-dat.sha256sum] =
>     "c339e20cdf326c18aa3571bcd27845e6daf41ca5bfe9401bc472908aaeb42ac7"
>     > I am seeing this with stable/thud-nmut ( mainly master)
>     >
>     > ERROR: geoip-1.6.12-r0 do_fetch: Checksum failure fetching
>     >
>     http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat
>     > ERROR: geoip-1.6.12-r0 do_fetch: Fetcher failure for URL:
>     >
>     'http://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz;apply=no;name=GeoIPv6-dat'.
>     > Checksum mismatch!
>     > File: '/build/downloads/thud/GeoIPv6.dat.gz' has md5 checksum
>     > e75b84a4044e81d6d4484e33816bc762 when
>     00dc3b3f53eb5f7bf6915f939998f12c
>     > was expected
>     > File: '/build/downloads/thud/GeoIPv6.dat.gz' has sha256 checksum
>     > a009b0f21968d2868e6dd19d14f3c3b8cd60ae84a4bfc2970df34d771a04811e
>     when
>     > e72221fc630094d7256521b307e9142fb77d2167a27de2c11da536a2ba1d1480 was
>     > expected
>     > If this change is expected (e.g. you have upgraded to a new version
>     > without updating the checksums) then you can use these lines
>     within the
>     > recipe:
>     > SRC_URI[GeoIPv6-dat.md5sum] = "e75b84a4044e81d6d4484e33816bc762"
>     > SRC_URI[GeoIPv6-dat.sha256sum] =
>     > "a009b0f21968d2868e6dd19d14f3c3b8cd60ae84a4bfc2970df34d771a04811e"
>     > Otherwise you should retry the download and/or check with
>     upstream to
>     > determine if the file has become corrupted or otherwise unexpectedly
>     > modified.
>     >
>     > - armin
>
>     Hi,
>
>     This recipe is special, it use git to download GeoLite databse from
>
>     https://dev.maxmind.com/geoip/legacy/geolite/, but the database is
>
>     not versioned,  and the database, eg, GeoIPv6.dat.gz  , checksum
>     changes
>
>     frequently.  I have change it two times recently. and today, I
>     checked the
>
>     checksum changed again,  also different with report checksum above.
>
>
>     we need to figure out a solution to reslove this instead change
>     the checksum
>
>     again and again.   Especially,  the database will be deleted from the
>     web from
>
>     2019. 2.
>
>
>     >>
>     >>   LICENSE = "LGPL-2.1"
>     >>
>     >
>     -- 
>     BRs
>
>     Sandy(Li Changqing)
>
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
-- 
BRs

Sandy(Li Changqing)


