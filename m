Received: from [66.249.92.170] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I8CWM-000867-Rd
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jul 2007 12:00:39 +0200
Received: by ug-out-1314.google.com with SMTP id i24so1307389ugd
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2007 02:54:59 -0700 (PDT)
Received: by 10.86.93.17 with SMTP id q17mr330233fgb.1184061299075;
	Tue, 10 Jul 2007 02:54:59 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.98.21])
	by mx.google.com with ESMTP id j9sm53054039mue.2007.07.10.02.54.57
	(version=SSLv3 cipher=OTHER); Tue, 10 Jul 2007 02:54:58 -0700 (PDT)
Date: Tue, 10 Jul 2007 12:54:40 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <986250811.20070710125440@gmail.com>
To: Graeme Gregory <dp@xora.org.uk>
In-Reply-To: <E1I8BNL-0002lu-BC@linuxtogo.org>
References: <E1I8BNL-0002lu-BC@linuxtogo.org>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev packages/glib-2.0/glib.inc : remove bogus ${PN}-dev from packages.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2007 10:00:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello xora,

Tuesday, July 10, 2007, 11:47:15 AM, you wrote:

> packages/glib-2.0/glib.inc : remove bogus ${PN}-dev from packages.

> Author: xora@openembedded.org
> Branch: org.openembedded.dev
> Revision: 2f67b52cb2be4988db873678ab4f354aea217a90
[]
> ============================================================
> --- packages/glib-2.0/glib.inc 
> 09c2d1615f7c249f8ab1c68778bafbc98293ff6b
> +++ packages/glib-2.0/glib.inc 
> 3b5260371e84b9c12db9a8cdc8c5809bab8d2ec5
> @@ -8,7 +8,7 @@ DEPENDS += "virtual/libiconv virtual/lib
>  PRIORITY = "optional"
>  DEPENDS += "glib-2.0-native gtk-doc"
>  DEPENDS += "virtual/libiconv virtual/libintl"
> -PACKAGES =+ "${PN}-dev glib-2.0-utils "
> +PACKAGES =+ " glib-2.0-utils "

  This is not bogus. For this package, -dev must be packaged before
the main package, or the latter will get *.h and *.m4 files. Putting
something in packages twice works after all, and we should either
accept its usage fro such cases, or find other solution to do proper
flexible packaging (and that would be a bit hard on syntax. Maybe add
UNFILES?)




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



