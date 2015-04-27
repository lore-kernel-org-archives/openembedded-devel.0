Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 561C8727E8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 18:50:19 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so71273745igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 11:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=YnvICQmvI5In2JW7FZOw0ZTCE1KDN02+8kPNlSiGBwI=;
	b=FbGbzy8Z4k+MA6vj2jmlHNQ1IcogZYagip7T4+RbFtCeQqVuGSySC0yHmM/tX3DCEZ
	tfuL2aq6hHwyLmXlo+u1HOr4ltqJdVz4n0Sj+Ia4mpOP0khqf+BRCE36+/jDEhnd2dOf
	RdoOZErt0OnBSCyQDaoQ5QbkPfdeoIjxeCbKQVgE5eszOaW4Yogs87fY2awhMq5euQxf
	dou3iphj/BwAQCTzRXidpP2YqhrZi+6/TfOAmZwYODPouXFwYM9tFl6vF4spcTOyYSs4
	dqIi1vRaanUiEao6jnCkzIEq9lxbJotD/ONNR1jKoXtZ3J8YQythWKT7BGtuUjG5pa3w
	/YRA==
MIME-Version: 1.0
X-Received: by 10.107.134.206 with SMTP id q75mr15463394ioi.27.1430160621161; 
	Mon, 27 Apr 2015 11:50:21 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Mon, 27 Apr 2015 11:50:21 -0700 (PDT)
In-Reply-To: <1430160343-2781-3-git-send-email-Martin.Jansa@gmail.com>
References: <1430160343-2781-1-git-send-email-Martin.Jansa@gmail.com>
	<1430160343-2781-3-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 27 Apr 2015 15:50:21 -0300
X-Google-Sender-Auth: 1Cc2hHxP6BN0j8OAHFa6IyN2jTc
Message-ID: <CAP9ODKr9Ld8ZkogqZnVoKu=Ahh9Jb58EXMR0=xvZvYKzUgfKgA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/4] gsoap-native: add missing dependency on flex-native
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
X-List-Received-Date: Mon, 27 Apr 2015 18:50:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2015 at 3:45 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * otherwise fails with:
> | gcc  -DHAVE_CONFIG_H -I. -I/work/x86_64-linux/gsoap-native/2.8.12-r1/gs=
oap-2.8/gsoap/src -I../..   -isystem/sysroots/x86_64-linux/usr/include -DWI=
TH_BISON -DWITH_LEX  -DSOAPCPP_IMPORT_PATH=3D"\"/sysroots/x86_64-linux/usr/=
share/gsoap/import\"" -DLINUX -isystem/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c -o soapcpp2-soapcpp2_yacc.o `test -f 'soapcpp2_yacc.c' || echo '=
/work/x86_64-linux/gsoap-native/2.8.12-r1/gsoap-2.8/gsoap/src/'`soapcpp2_ya=
cc.c
> | /bin/bash /work/x86_64-linux/gsoap-native/2.8.12-r1/gsoap-2.8/ylwrap /w=
ork/x86_64-linux/gsoap-native/2.8.12-r1/gsoap-2.8/gsoap/src/soapcpp2_lex.l =
.c soapcpp2_lex.c -- /bin/bash /work/x86_64-linux/gsoap-native/2.8.12-r1/gs=
oap-2.8/missing flex
> | /work/x86_64-linux/gsoap-native/2.8.12-r1/gsoap-2.8/missing: line 81: f=
lex: command not found
> | WARNING: 'flex' is missing on your system.
> |          You should only need it if you modified a '.l' file.
> |          You may want to install the Fast Lexical Analyzer package:
> |          <http://flex.sourceforge.net/>
> | make[4]: *** [soapcpp2_lex.c] Error 127
> | make[4]: Leaving directory `/work/x86_64-linux/gsoap-native/2.8.12-r1/b=
uild/gsoap/src'
> | make[3]: *** [all-recursive] Error 1


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

It is missing your Signed-off-by ...

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

