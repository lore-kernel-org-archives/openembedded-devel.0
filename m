Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QnmX2-000603-2q
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 09:03:20 +0200
Received: by fxg11 with SMTP id 11so4770289fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 31 Jul 2011 23:59:00 -0700 (PDT)
Received: by 10.204.144.135 with SMTP id z7mr1138311bku.245.1312181940277;
	Sun, 31 Jul 2011 23:59:00 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id v3sm1210689bku.63.2011.07.31.23.58.58
	(version=SSLv3 cipher=OTHER); Sun, 31 Jul 2011 23:58:59 -0700 (PDT)
Message-ID: <4E364EB1.8050800@dresearch-fe.de>
Date: Mon, 01 Aug 2011 08:58:57 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 1.2
Cc: Koen Kooi <koen@openembedded.org>
Subject: unnecessary dependencies?
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
X-List-Received-Date: Mon, 01 Aug 2011 07:03:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We are working on an application which requires libgssdp.

libgssdp requires libsoup, libsoup inherits gnome, gnome inherits gtk-icon-cache, gtk-icon-cache rdepends hicolor-icon-theme. So this icon theme (probably a lot more gnome stuff) unnecessarily allocates place in our image (we do not have a GUI). :(

Are these deps really necessary?

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


