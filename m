Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vadmium@gmail.com>) id 1Pf55t-00050J-DT
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Jan 2011 07:31:05 +0100
Received: by wyb40 with SMTP id 40so5917455wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 22:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=X+zxUW/oeAO4Rz9bscztrf+vCITvgEMEQCchHnjt4hY=;
	b=fAsIUT7qPcbFIPtSgPUh//6jI5sDPdnHpIYJvOZCg2BKCY7n1flx5aXLShwHj0A5V1
	qM7a961DmgGyKMXGzZnjLIAqabEKT6o8gdCHMdoykzylOZFvDolj4Moo+fb8QKTstnxH
	JrVYF5kGYBSLypXXTBIt5x1V4mqZ0ipelU/VE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=KcjiyRpackvoNnc4JtLyCTbNjCiecVvI/kmzoIlTnpPtpLp6SBqF++/Z0Ztv0sL2E4
	sj3HWUiKJZ0oZKbh3wHee0DnYRpH0tFNNEGznMlUjhRqvnRc9xcpdb0hlB/a+z/S6ABa
	vGyhFOuYEwGn2q0YupMYmrd8I7AJob6NAaFmQ=
MIME-Version: 1.0
Received: by 10.216.48.6 with SMTP id u6mr4008329web.77.1295332227052; Mon, 17
	Jan 2011 22:30:27 -0800 (PST)
Sender: vadmium@gmail.com
Received: by 10.216.17.203 with HTTP; Mon, 17 Jan 2011 22:30:26 -0800 (PST)
In-Reply-To: <AANLkTi=q0Qa2w=Tn1kPGcA2Y5c6t3kfAfoRj8x1uvn2y@mail.gmail.com>
References: <AANLkTi=q0Qa2w=Tn1kPGcA2Y5c6t3kfAfoRj8x1uvn2y@mail.gmail.com>
Date: Tue, 18 Jan 2011 06:30:26 +0000
X-Google-Sender-Auth: TGDCmFgh3L3RccOvmP56iXO22RE
Message-ID: <AANLkTin3gEL9GaYJRvqdRsK5WaU=Ce9zx=i50X=Kpqqq@mail.gmail.com>
From: Martin Panter <vadmium+floss@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Avoid issues with APR package detecting Libtool
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
X-List-Received-Date: Tue, 18 Jan 2011 06:31:05 -0000
Content-Type: text/plain; charset=UTF-8

Hi all

On 16 January 2011 12:32, Martin Panter <vadmium+floss@gmail.com> wrote:
> The configure script was failing for APR, I think because it was
> trying to hack Libtool internals and wasn't compatible with newer
> Libtool 2.4. Fixed for me with attached patch.

That with the recent APR 1.3.12 commit b1ae47c by Martin Jansa it
compiles so my change is no longer necessary.

For reference the full error was like this:

| buildconf: checking installation...
| buildconf: python version 2.6.5 (ok)
| build/buildcheck.sh: line 26: test: 65-: integer expression expected
| buildconf: autoconf version 2.65- (ok)
| Copying libtool helper files ...
| /libtool.m4 not found
| ERROR: Function do_configure failed


