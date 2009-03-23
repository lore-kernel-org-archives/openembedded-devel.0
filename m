Received: from [74.125.92.145] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LlfVi-0006pL-1y
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 09:27:54 +0100
Received: by qw-out-1920.google.com with SMTP id 5so890903qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Mar 2009 01:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=WIIGEIj4/p1vajoTGXwLtQ5rdBAA6SaEB4eeEs8c5TU=;
	b=q5+SAMMZ0EEpgiigIqMqPHKrGP7vwk7vP57ALbEfHnfJk+FZavbYwp5GsZi1oJOwZH
	pve7wI03f1EhOuk1P5R9A6OHnEqYg/DX0ydyhjILJZtp73pfi3roFs6N2Qhwvtfsfmzd
	aNAOZtZvXSBakzzLosx8arWKILvxpDI5z/920=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=TjHzEL+qb7qtGNQt3AA9LEVRA79UK+OKaBftEUWvBdevO0mdRkXfxqIqaroYQkBApv
	YnRxSUdGrV1kV01Bk2MbNVT+9xYqK2NU/x6zj6dAjnfSY5l9/QqMHCIPAA8dejyLt3ZF
	vUOd7utQREZw9rUTQngO8yw2ylyz7ZGLYhHS8=
Received: by 10.224.28.70 with SMTP id l6mr2581155qac.52.1237796793037;
	Mon, 23 Mar 2009 01:26:33 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm8977731ywp.11.2009.03.23.01.26.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 23 Mar 2009 01:26:32 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id B9F036100E0; Mon, 23 Mar 2009 05:26:29 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <200902140035.13820.khimov@altell.ru>
	<200902141715.56797.khimov@altell.ru>
	<87ocx3y2xu.fsf@neumann.lab.ossystems.com.br>
	<200902171525.28995.khimov@altell.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Mon, 23 Mar 2009 05:26:28 -0300
In-Reply-To: <200902171525.28995.khimov@altell.ru> (Roman I. Khimov's message
	of "Tue, 17 Feb 2009 15:25:28 +0300")
Message-ID: <877i2g63wr.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Subject: Re: [PATCH] New package: siproxd
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
X-List-Received-Date: Mon, 23 Mar 2009 08:27:54 -0000
Content-Type: text/plain; charset=us-ascii

Roman I Khimov <khimov@altell.ru> writes:

> Otavio Salvador:

[...]


[...]

> +do_install_append() {
> +	mv ${D}/${sysconfdir}/siproxd.conf{.example,}
> +}

[...]


This is bashims, it would be better to use expanded commands
instead. Except from it, it looks OK for me.

Mind to fix it? 

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


