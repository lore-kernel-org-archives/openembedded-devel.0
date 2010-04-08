Received: from exprod5og111.obsmtp.com ([64.18.0.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nzokq-0006Wl-M4
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 12:14:45 +0200
Received: from source ([4.79.213.129]) (using TLSv1) by
	exprod5ob111.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS72rvo6Hkk9fXoM4CpCqsery7J3tMdTv@postini.com;
	Thu, 08 Apr 2010 03:11:12 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Alpmlip07.e2k.ad.ge.com with ESMTP; 08 Apr 2010 06:11:23 -0400
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 08 Apr 2010 06:11:09 -0400
Message-ID: <4BBDAC94.10905@ge.com>
Date: Thu, 08 Apr 2010 11:14:44 +0100
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1270719003-6168-1-git-send-email-ospite@studenti.unina.it>
	<1270719003-6168-2-git-send-email-ospite@studenti.unina.it>
In-Reply-To: <1270719003-6168-2-git-send-email-ospite@studenti.unina.it>
X-SA-Exim-Connect-IP: 64.18.0.22
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] tzcode-native_2010f: Update tzdata SRC_URI and checksum
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
X-List-Received-Date: Thu, 08 Apr 2010 10:14:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Antonio Ospite wrote:
> tzdata2010g is no longer available, use tzdata2010h
>
> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> ---
>  recipes/tzcode/tzcode-native_2010f.bb |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes/tzcode/tzcode-native_2010f.bb b/recipes/tzcode/tzcode-native_2010f.bb
> index 6c361ac..fdd35ba 100644
> --- a/recipes/tzcode/tzcode-native_2010f.bb
> +++ b/recipes/tzcode/tzcode-native_2010f.bb
> @@ -6,11 +6,11 @@ require tzcode-native.inc
>  # fix this URLs
>  SRC_URI = " \
>  	ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz;name=tzcode-${PV} \
> -	ftp://elsie.nci.nih.gov/pub/tzdata2010g.tar.gz;name=tzdata-2010g \
> +	ftp://elsie.nci.nih.gov/pub/tzdata2010h.tar.gz;name=tzdata-2010h \
>  	"
>  SRC_URI[tzcode-2010f.md5sum] = "e530cc9bbdfd5e8c1eac21a68f4d5656"
>  SRC_URI[tzcode-2010f.sha256sum] = "651d866c91ada925b4ac9491e69ebd5c355c46b2c01dd1741b5e6a609d93eb1e"
> -SRC_URI[tzdata-2010g.md5sum] = "d0e8f560977470b0fc65b79b585cf5e4"
> -SRC_URI[tzdata-2010g.sha256sum] = "a069dbea2989613466f9f4adb6de381efb46aeb9ff89e03fabb23dcae2c4cd90"
> +SRC_URI[tzdata-2010g.md5sum] = "d384ac091e6d56802f9b3e6b3d3f0f2e"
> +SRC_URI[tzdata-2010g.sha256sum] = "a4918d60f63440ba9b6050205881e8a98d718dc0c2b7df5955f43e781eab6e7d"
>  
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>   
Why is a recipe for "tzcode-native_2010f" downloading "tzdata2010g", let
alone "tzdata2010h"?

Surely a new recipe called "tzcode-native_2010h" is called for?

Martyn

-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189



