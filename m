Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwhoosier@gmail.com>) id 1IlPkp-0006hA-F6
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2007 16:01:41 +0200
Received: by py-out-1112.google.com with SMTP id a25so1688147pyi
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2007 06:54:10 -0700 (PDT)
Received: by 10.35.78.9 with SMTP id f9mr3436521pyl.1193405325076;
	Fri, 26 Oct 2007 06:28:45 -0700 (PDT)
Received: by 10.35.15.5 with HTTP; Fri, 26 Oct 2007 06:28:45 -0700 (PDT)
Message-ID: <d543f5920710260628m752ebe95qb0e874df43f46cf8@mail.gmail.com>
Date: Fri, 26 Oct 2007 08:28:45 -0500
From: "Matt Hoosier" <matt.hoosier@gmail.com>
Sender: mwhoosier@gmail.com
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Google-Sender-Auth: 6524931f3644e9e2
Subject: GLIBC_BROKEN_LOCALES
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
X-List-Received-Date: Fri, 26 Oct 2007 14:01:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I happened to run afoul of this when trying to build an image for a
product that contains tr_TR as one of its localizations.

What sort of misbehavior does a locale have to engage in before being
banished to this list? I looked at the patches for whichever Ubuntu
release also uses glibc-2.5, and can't find any evidence that they do
anything to fix the tr_TR localedata in glibc before compiling. Nor do
they, as best I can tell, blacklist it the way that OE does.

--Matt


