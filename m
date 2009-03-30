Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LoGHE-0004bY-KH
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 14:07:40 +0200
Received: by qw-out-1920.google.com with SMTP id 5so1346745qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2009 05:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=l1ujRdkEUGi6VieeNnNsSglsDJZHOd0JOYXNnJ7FLKk=;
	b=jduhHxJZNe75CC+3wKVEZJzaGkVC4kjLV+6XOmlAQwds+SK7iDARpxU5nlGjmf7dTZ
	boPekhq+5YPMZMDx1ovGlRWUeq6MhLI0ahh0FAB5qxsja5LEJ4CVD2JXgRZso4nrcK7R
	oDcO0VBl1SQwv/aL5KAFrUXydu4rkmcKoq2WQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=i7T+5XuHTGo5Fh8X6LR4YsKiPkGTM3SUcGRtTb00RDnHKlgd3AGrS9MSqd9Zo91Eau
	nEyFRcujhD6e7IfHI2sNmTVe4vldifqsPlMOP1qlzg4j+dbPrSlAdBDMfxT++ZSFtxgR
	OHbI5y/G+9YJ3Z8innXJ5T4/gHhiyhezePSkc=
Received: by 10.224.2.202 with SMTP id 10mr5954299qak.337.1238414734636;
	Mon, 30 Mar 2009 05:05:34 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 5sm3954624ywl.8.2009.03.30.05.05.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 30 Mar 2009 05:05:34 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 72A98610096; Mon, 30 Mar 2009 09:05:40 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <ef4946070903292210t3ce4885cj1298cdaa0253ffdf@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Mon, 30 Mar 2009 09:05:40 -0300
In-Reply-To: <ef4946070903292210t3ce4885cj1298cdaa0253ffdf@mail.gmail.com>
	(Joshua Jackson's message of "Mon, 30 Mar 2009 01:10:10 -0400")
Message-ID: <8763hr43mz.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Subject: Re: Addition of the Coyote Linux distro and HAProxy
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
X-List-Received-Date: Mon, 30 Mar 2009 12:07:41 -0000
Content-Type: text/plain; charset=us-ascii

Joshua Jackson <jjackson@vortech.net> writes:

Hello Joshua,

[...]

> The file is a standard, unified diff against the vanilla OE tree (pulled
> just before this email as sent).

[...]

Please send patches in git format; you can take a look on how to do that
at 'git format-patch --help'. This allow us to apply it easily.

Another thing, please split your changes in logical patches.

As you said that your distro is borning, from OE POV, I suggest you to
use a branch to work on that and maybe put it somewhere for review and
full merge once instead of in progress patches.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


