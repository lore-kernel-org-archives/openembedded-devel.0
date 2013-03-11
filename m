Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UF6WS-00067h-Fn
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Mar 2013 18:28:28 +0100
Received: by mail-pb0-f44.google.com with SMTP id wz12so3983766pbc.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Mar 2013 10:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=720z+2tFNIc5mv2wWi2EdvFGIx89Sczd9l2lBArqDKg=;
	b=Z4RBkJ4rOEj4FurwX2NOlzcPjKP6Pba2ekAqJojy00k1/YGzSdneDPbEM0ArngdJkO
	YE3UO4Pv8+DfXF4Y0efhDt8KHHJrAS4ivwMqfwLschH+o91LP4sFS9fZg746THUt/g5I
	EqsjYmfTQjG8nrNNT0AB9FzP8aqIYGJbCg/MG8ZFk7r2qwKfSzS6IfwN5kGQw+pn0kKX
	JQa0Vc0SfZXm4t8KJzbCr4uodyyFLp24tdUucOctVx1EoRccrcE/0IwQRIBZkApl1WyI
	YAUIDakn0Y5zc5qC2Kn654Uj6Xq0P4JTKhRei+TqCWbPAJz+KrtPelHQ5Y4YYMUhEmKF
	crVg==
X-Received: by 10.68.189.199 with SMTP id gk7mr22840377pbc.164.1363021909510; 
	Mon, 11 Mar 2013 10:11:49 -0700 (PDT)
Received: from [172.23.7.5] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id in5sm12528025pbc.20.2013.03.11.10.11.47
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 10:11:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1362998354-7195-2-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 11 Mar 2013 10:11:46 -0700
Message-Id: <DF8EE363-1CB9-4E9F-B0B0-A496977C7689@gmail.com>
References: <1362998354-7195-1-git-send-email-koen@dominion.thruhere.net>
	<1362998354-7195-2-git-send-email-koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1499)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-multimedia][PATCH 2/2] xbmc: add patch to make 'ld-is-gold' work with configure
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
X-List-Received-Date: Mon, 11 Mar 2013 17:28:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 11, 2013, at 3:39 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:

> ++  #set -x
> +   if [[ "$host_vendor" !=3D "apple" ]]; then
> +     AC_MSG_CHECKING([for lib$2 soname])
> +     $1_FILENAME=3D$($CC -nostdlib -o /dev/null $LDFLAGS -l$2 -Wl,-M =
2>/dev/null | grep "^LOAD.*$2" | awk '{V=3D2; print $V}')
> ++    if [[ -z $$1_FILENAME ]]; then
> ++      #try gold linker syntax
> ++      $1_FILENAME=3D$($CC -nostdlib -o /dev/null $LDFLAGS -l$2 =
-Wl,-t 3>&1 1>&2 2>&3 | grep "$2")
> ++    fi
> +     if [[ ! -z $$1_FILENAME ]]; then
> +       $1_SONAME=3D$(objdump -p $$1_FILENAME | grep "SONAME.*$2" | =
awk '{V=3D2; print $V}')
> +     fi
> +@@ -55,6 +60,7 @@ AC_DEFUN([XB_FIND_SONAME],
> +     AC_MSG_RESULT([$$1_SONAME])
> +     AC_SUBST($1_SONAME)
> +   fi
> ++  #set +x

these set -x can be removed but if its upstream like that then fine.=20



