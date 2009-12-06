Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NHIX7-0007No-QL
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 15:56:24 +0100
Received: by yxe5 with SMTP id 5so1534595yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 06:54:42 -0800 (PST)
Received: by 10.90.11.10 with SMTP id 10mr6169579agk.51.1260111281832;
	Sun, 06 Dec 2009 06:54:41 -0800 (PST)
Received: from localhost (166-70-153-80.ip.xmission.com [166.70.153.80])
	by mx.google.com with ESMTPS id 20sm2910409iwn.9.2009.12.06.06.54.40
	(version=SSLv3 cipher=RC4-MD5); Sun, 06 Dec 2009 06:54:41 -0800 (PST)
Date: Sun, 6 Dec 2009 07:54:42 -0700
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091206075442.5eda3c23@xora.org.uk>
In-Reply-To: <ac9c93b10912060417x27e41790k5c1826d19898b7dc@mail.gmail.com>
References: <4B14BAD9.2060402@fqingenieria.es>
	<20091201072521.GA11505@denix.org> <4B14D2E1.6050506@SSpaeth.de>
	<20091201194025.GB11505@denix.org> <4B1611C3.7050101@SSpaeth.de>
	<20091202114959.GA8668@zlo.nu>
	<ac9c93b10912060417x27e41790k5c1826d19898b7dc@mail.gmail.com>
X-Mailer: Claws Mail 3.7.3 (GTK+ 2.18.3; i686-redhat-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Recipes relation tree
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
X-List-Received-Date: Sun, 06 Dec 2009 14:56:25 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 6 Dec 2009 13:17:16 +0100
Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:

> It would also be nice to be able to get the used by information.
> E.g. if I change a package (especially wrt staging) I would like to
> verify that the packages which use the modified package still build.
> 
> The current el-cheapo solution for a package XYZ is to do something
> like a grep  DEPENDS.*XYZ */*.bb but of course that won't work if
> DEPENDS spans multiple lines.
> 
bitbake -g target will drop a dependency graph in the directory you run
bitbake from.

Graeme


