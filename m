Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I6Fir-0003Xe-Gs
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2007 03:01:31 +0200
Received: by ug-out-1314.google.com with SMTP id i24so398348ugd
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jul 2007 17:56:21 -0700 (PDT)
Received: by 10.82.158.12 with SMTP id g12mr19110049bue.1183596980803;
	Wed, 04 Jul 2007 17:56:20 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.98.17])
	by mx.google.com with ESMTP id j2sm43538998mue.2007.07.04.17.56.19
	(version=SSLv3 cipher=OTHER); Wed, 04 Jul 2007 17:56:19 -0700 (PDT)
Date: Thu, 5 Jul 2007 01:15:39 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <1798199350.20070705011539@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Too liberal defaults for FILES_${PN}?
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
X-List-Received-Date: Thu, 05 Jul 2007 01:01:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

    This one concerns me: ${libdir}/${PN}/*

Due to it we get following -dev garbage in libglib-2.0:

/usr/lib/glib-2.0/include/glibconfig.h
/usr/share/glib-2.0/gettext/po/Makefile.in.in
/usr/share/glib-2.0/gettext/mkinstalldirs

  I'm going to commit an adhoc workaround, but wonder how grounded
that default above.

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



