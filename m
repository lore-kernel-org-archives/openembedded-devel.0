Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lp7lw-0002KT-Aq
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 23:15:07 +0200
Received: by qw-out-1920.google.com with SMTP id 5so219482qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2009 14:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:user-agent:x-url:x-attribution:date:message-id
	:mime-version:content-type;
	bh=Td9ePsrS3y5XLnBaJiQRzSLxMM+HGmHxwidYemDvJBk=;
	b=LFNilQ/LdQNsb5PS6TPmEOXZxyyjh1XDgOuJzblPCJmx9pXRDRG4cckuvPwZkrwBPS
	zk66pF+b9hdyoxhIkZs5SycV1a2kWk3grl+8dSE2vjZgXKA2+gOv40qxB+/x8ECaqOSR
	rB+ocFVqbFD8i03f/EwzyjFNujwMhdLBc3lYs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:user-agent:x-url:x-attribution
	:date:message-id:mime-version:content-type;
	b=dTW5Q7dxBWxrfyKJZ2rhb0jqMKwnGCxmvfMo0+1Yla5l5efgKxBNhmma6FwERr8Tp1
	KUDk6j+ahUO0sXoAiXbsRvP9VCwfsoMwN7XmRF9GCpbK+7EO8hGueCY9fAohwUCyyHV7
	Yy3ED2h/8npiYGdf4G35QyIhQOtve0vNb/0o4=
Received: by 10.224.20.76 with SMTP id e12mr10673704qab.47.1238620355322;
	Wed, 01 Apr 2009 14:12:35 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 8sm333399ywg.4.2009.04.01.14.12.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Apr 2009 14:12:34 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 077E56101AF; Wed,  1 Apr 2009 18:12:43 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Development Mailing List
	<openembedded-devel@lists.openembedded.org>
Organization: O.S. Systems Ltda.
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Wed, 01 Apr 2009 18:12:43 -0300
Message-ID: <87tz583wok.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 74.125.92.147
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFH] Ugly dependency on a locale package
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
X-List-Received-Date: Wed, 01 Apr 2009 21:15:11 -0000
Content-Type: text/plain; charset=us-ascii

Hello,

Today we spot a wierd package in our image and then we ended figuring
out that something quite strange is happening.

 new debian package, version 2.0.
 size 9880 bytes: control archive= 471 bytes.
     497 bytes,    13 lines      control              
 Package: evince-locale-pt-br
 Version: 2.24.1-r2.1
 Description: pt_BR translation for evince
 Section: x11/office
 Priority: optional
 Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
 License: GPL
 Architecture: geode
 OE: evince
 Homepage: http://www.ossystems.com.br
 Depends: evince-nautilus-extension, virtual-locale-pt-br
 Provides: evince-locale, pt-br-translation
 Source: http://ftp.gnome.org/pub/GNOME/sources/evince/2.24/evince-2.24.1.tar.bz2 file://no-help-dir.patch;patch=1


Look the line:

  Depends: evince-nautilus-extension, virtual-locale-pt-br
           ^^^^^^^^^^^^^^^^^^^^^^^^^

WHY?


-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


