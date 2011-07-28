Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QmOZh-0005KA-2O
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 13:16:21 +0200
Received: by fxg11 with SMTP id 11so1279451fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2011 04:12:05 -0700 (PDT)
Received: by 10.204.143.4 with SMTP id s4mr311243bku.98.1311851189735;
	Thu, 28 Jul 2011 04:06:29 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id t2sm244722bku.0.2011.07.28.04.06.28
	(version=SSLv3 cipher=OTHER); Thu, 28 Jul 2011 04:06:28 -0700 (PDT)
Message-ID: <4E3142B3.10109@dresearch-fe.de>
Date: Thu, 28 Jul 2011 13:06:27 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1311844212-23277-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1311844212-23277-1-git-send-email-koen@dominion.thruhere.net>
X-Enigmail-Version: 1.2
Subject: Re: [2011.03-maintenance] gcc-package-target: fix for gcc 4.3.x
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
X-List-Received-Date: Thu, 28 Jul 2011 11:16:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.07.2011 11:10, Koen Kooi wrote:
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  recipes/gcc/gcc-package-target.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/gcc/gcc-package-target.inc b/recipes/gcc/gcc-package-target.inc
> index 33567da..7d3f4ae 100644
> --- a/recipes/gcc/gcc-package-target.inc
> +++ b/recipes/gcc/gcc-package-target.inc
> @@ -171,5 +171,5 @@ GROUP ( libgcc_s.so.1 libgcc.a )" > ${D}${libdir}/libgcc_s.so
>  	rm -rf ${D}${includedir}/c++/${BINV}/${TARGET_SYS}/bits/*.gch
>  	# move the gdb python helpers to gdb auto-load directory
>  	install -d ${D}${datadir}/gdb/auto-load/${libdir}
> -	mv ${D}${libdir}/libstdc++.so.*-gdb.py* ${D}${datadir}/gdb/auto-load${libdir}
> +	mv ${D}${libdir}/libstdc++.so.*-gdb.py* ${D}${datadir}/gdb/auto-load${libdir} || true
>  }

Acked-by: Steffen Sledz <sledz@dresearch-fe.de>

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


