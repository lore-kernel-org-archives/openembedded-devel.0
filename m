Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.14])
	by mail.openembedded.org (Postfix) with ESMTP id B29F765DF6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 09:01:05 +0000 (UTC)
Received: from [216.82.249.131:31195] by server-14.bemta-12.messagelabs.com id
	35/51-12296-15C05435; Wed, 09 Apr 2014 09:01:05 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-4.tower-28.messagelabs.com!1397034038!27810195!3
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.11.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30972 invoked from network); 9 Apr 2014 09:01:05 -0000
Received: from mail.mx1.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-4.tower-28.messagelabs.com with RC4-SHA encrypted SMTP;
	9 Apr 2014 09:01:05 -0000
Received: from mcl-sms-exch01.digi.com (10.5.8.50) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Wed, 9 Apr 2014 04:00:54 -0500
Received: from dor-sms-exch01.digi.com (10.49.8.100) by
	mcl-sms-exch01.digi.com (10.5.8.50) with Microsoft SMTP Server (TLS) id
	8.3.342.0; Wed, 9 Apr 2014 04:00:38 -0500
Received: from [10.101.2.54] (10.101.2.54) by dor-sms-exch01.digi.com
	(10.49.8.100) with Microsoft SMTP Server (TLS) id 8.3.342.0;
	Wed, 9 Apr 2014 11:00:26 +0200
Message-ID: <53450C29.5060202@digi.com>
Date: Wed, 9 Apr 2014 11:00:25 +0200
From: Javier Viguera <javier.viguera@digi.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <53450A23.3060107@linaro.org>
In-Reply-To: <53450A23.3060107@linaro.org>
Subject: Re: checksums for multiple sources
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
X-List-Received-Date: Wed, 09 Apr 2014 09:01:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Trevor,

You can put names to the different tarballs and then set the checksums 
for each one of them with following syntax:

SRC_URI = " \
     http://...;name=tarball1 \
     http://...;name=tarball2 \
"

SRC_URI[tarball1.md5sum] = "..."
SRC_URI[tarball1.sha256sum] = "..."

SRC_URI[tarball2.md5sum] = "..."
SRC_URI[tarball2.sha256sum] = "..."

-
Javier Viguera
Software Engineer
Digi International® Spain S.A.U.



On 09/04/14 10:51, Trevor Woerner wrote:
> Is there any way to specify for which source tarball a particular
> checksum is referring?
>
> meta-openembedded/meta-oe/recipes-extended/acpica/acpitests_20140114.bb
> has 2 source tarballs (and a patch):
>
>      SRC_URI =
>      "https://acpica.org/sites/acpica/files/acpitests-unix-${PV}.tar.gz \
>
>      https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
>                 file://0001-Fixup-aapits-build.patch \
>          "
>
> but only one set of checksums:
>
>      SRC_URI[md5sum] = "c72b61e092d2b25726dfff6e455116c9"
>      SRC_URI[sha256sum] =
>      "368f69296edef5138fd33affa2d50bdcdd1dfd2f6919ba782f8ecf03971a3a2c"
>
>
> My build fails because it tries to verify the one checksum against both
> source tarballs, which fails:
>
>      File: '/home/trevor/devel/Downloads/acpica-unix2-20140114.tar.gz'
>      has md5 checksum fcd4b7304f1bfabc7d4b9cfdecc6b0c6 when
>      c72b61e092d2b25726dfff6e455116c9 was expected
>
> NOTE: this checksum is correct for the first tarball
> (acpitests-unix-${PV}.tar.gz), but not the second
> (acpica-unix2-${PV}.tar.gz).
>



