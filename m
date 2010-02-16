Received: from mail-fx0-f210.google.com ([209.85.220.210])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NhNt2-0003w2-HD
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 14:54:51 +0100
Received: by fxm2 with SMTP id 2so3027862fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 05:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=lyCES97LN5EWoz1YNzUExCdZrHjRRPA20+lGaF0O/zg=;
	b=CO6+81KGNAQHRUt5G+hQbdXQ02oBFpoeCh+uPNZf9Xs7tzcCmb5CWAtK7rDLIy5eHY
	SBI+tefINRKWAjrWIZmzTNHubJC08319594Y0Iqpzm0bPbkYiBG+xwEoNPlskenil9Zm
	G97M4p0h+5T54s0gy5Vcg0eeKaIXPD9uE78yE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=rHEuiFuaBQsp1kewDwIMLuzub7IsSn2LWLqoNvUHnmtFFc7XcY4O68qsA5jphmeYHt
	rzWL3cprQYlzuVIEblthMpI7bqBs8dE0/oVsD48x2kqMpOIq5Uvj/kx4QboD1CAv0Esk
	hnQPa5tdzQYtIQFEN4DbPOnZweFOb+IhNnh5Y=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.132.5 with SMTP id 5mr654882hbp.137.1266328329689; Tue, 16 
	Feb 2010 05:52:09 -0800 (PST)
In-Reply-To: <20100214135613.GF5364@jama>
References: <20100214135613.GF5364@jama>
Date: Tue, 16 Feb 2010 11:52:09 -0200
X-Google-Sender-Auth: 086318e0652ec7fd
Message-ID: <be7a9f3d1002160552gcd17ab4ye92dc6a824c30917@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.210
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Using bitbake in minimal chroot environment
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
X-List-Received-Date: Tue, 16 Feb 2010 13:54:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Sun, Feb 14, 2010 at 11:56 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> If nobody points some big disadvantage I didn't think about, I'll give
> it a try (with precompilled gentoo stage tarball it's task for half an
> hour using cp :)).
>
> Using some sofisticated sandbox setting (as gentoo ebuilds do) would be
> also good alternative, is someone trying that?

Take a look in cowbuilder, from Debian. It uses copy-on-write to
create chroots for building packages in a clean chroot; it might be
used to prepare a clean chroot to a full build of OE from time to OE
and catch bugs on it.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


