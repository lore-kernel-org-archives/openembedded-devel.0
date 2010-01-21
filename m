Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NY5Qa-00034C-Hv
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 23:23:04 +0100
Received: from 88-109-44-56.dynamic.dsl.as9105.com ([88.109.44.56]
	helo=[192.168.2.155])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NY5OF-0008Ml-6L
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 22:20:37 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263650387.5298.80.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1263292840.20557.80.camel@mattotaupa.wohnung.familie-menzel.net>
	<1263650387.5298.80.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Thu, 21 Jan 2010 22:20:12 +0000
Message-ID: <1264112412.457.1043.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] libcap: Append `-fPIC` to `CFLAGS` to fix compilation on newer binutils/ld. (was: [gcc 4.4.2] [libcap, vdr] relocation R_ARM_MOVW_ABS_NC against `a local symbol' can not be used when making a shared object; recompile with -fPIC)
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
X-List-Received-Date: Thu, 21 Jan 2010 22:23:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-01-16 at 14:59 +0100, Paul Menzel wrote:
> --- a/recipes/libcap/libcap_1.10.bb
> +++ b/recipes/libcap/libcap_1.10.bb
> @@ -3,9 +3,9 @@ PRIORITY = "optional"
>  SECTION = "libs"
>  LICENSE = "GPL"
>  DEPENDS = "bison-native flex-native"
> -PR = "r1"
> +PR = "r2"
>  
> -CFLAGS_append = " -I${S}/libcap/include"
> +CFLAGS_append = " -I${S}/libcap/include -fPIC"
>  

Thanks for the patch.  I checked this in.

p.




