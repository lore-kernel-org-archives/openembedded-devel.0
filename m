Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4E04472750
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Jan 2015 22:45:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t03MjXjQ021741
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 3 Jan 2015 14:45:33 -0800 (PST)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 3 Jan 2015 14:45:32 -0800
Message-ID: <54A8710B.3060203@windriver.com>
Date: Sun, 4 Jan 2015 06:45:31 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1420297183-16573-1-git-send-email-liezhi.yang@windriver.com>	<1420297183-16573-2-git-send-email-liezhi.yang@windriver.com>
	<20150103150344.GB24032@jama>
In-Reply-To: <20150103150344.GB24032@jama>
Subject: Re: [meta-networking] [PATCH 2/2] ncftp: use BPN in SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Jan 2015 22:45:42 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/03/2015 11:03 PM, Martin Jansa wrote:
> On Sat, Jan 03, 2015 at 06:59:43AM -0800, Robert Yang wrote:
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../recipes-daemons/ncftp/ncftp_3.2.5.bb           |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
>> index 73a88b4..4f13f90 100644
>> --- a/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
>> +++ b/meta-networking/recipes-daemons/ncftp/ncftp_3.2.5.bb
>> @@ -5,7 +5,7 @@ LICENSE = "ClArtistic"
>>   LIC_FILES_CHKSUM = "file://ncftp/cmds.c;beginline=3;endline=4;md5=9de76faeaedc4f908082e3f8142715f4"
>>   DEPENDS = "ncurses"
>>
>> -SRC_URI = "${DEBIAN_MIRROR}/main/n/${PN}/${PN}_${PV}.orig.tar.gz"
>> +SRC_URI = "${DEBIAN_MIRROR}/main/n/${PN}/${BPN}_${PV}.orig.tar.gz"
>
> Shouldn't it use BPN in both cases?

Yes, you are right, will send a V2, I've cheated by "bitbake lib32-ncftp -cfetch"
which was OK, it is because the tarball had been downloaded when
"bitbake ncftp -cfetch".

// Robert

>
>>   SRC_URI[md5sum] = "685e45f60ac11c89442c572c28af4228"
>>   SRC_URI[sha256sum] = "ac111b71112382853b2835c42ebe7bd59acb7f85dd00d44b2c19fbd074a436c4"
>>
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

