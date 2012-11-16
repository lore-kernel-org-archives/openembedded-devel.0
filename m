Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TZQ1S-0008RL-PL
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Nov 2012 18:48:11 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so1843603pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Nov 2012 09:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=mJwjCS9UPH3prEOGcnsiR/SpcmthYohCElLKf183ZQI=;
	b=rLNiXYuXon+eU54N+5eQ7J5ls60dB3rftOYOr22IPagnJle+zVNgUGuXi4olxoWa84
	twle7/q31fFQx0WaX6WBE1tFkmlVEixKc3hLmutgHsrqyiD4PuTv4FtysbA/PfTIMS1q
	nZgQn7p/WADoMYArx5Y+Db6GHl1NzDsaxlrzKR6cCG7YoFzPF9SGfe/8LErnNOwT2iVF
	H0DLwyYsUPxD7z5i5rF9lCuB+DCLG1hNWbzqA0Spd1Dk1gSN98AkjMsfeZqToCAhr4s/
	p1QGaqGXyzZ+UTMFkfryAq6MDBWSwhQuUJnPjLsKTkEPQpporrqe8QwOOYIY3bqSMVLe
	U5Lg==
MIME-Version: 1.0
Received: by 10.68.189.8 with SMTP id ge8mr17497576pbc.24.1353087251683; Fri,
	16 Nov 2012 09:34:11 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Fri, 16 Nov 2012 09:34:11 -0800 (PST)
In-Reply-To: <1353082893-16665-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1353082893-16665-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Date: Fri, 16 Nov 2012 15:34:11 -0200
X-Google-Sender-Auth: lUK8Q2JrsnN3k4hPP-Uhl4sfOAg
Message-ID: <CAP9ODKq6+AuC4uROveSbGMPNrOeFE5LWPecqM79fr3fDsgbhgw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	=?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: [PATCH] systemd.bbclass: move disable operation into prerm() script
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
X-List-Received-Date: Fri, 16 Nov 2012 17:48:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 16, 2012 at 2:21 PM, Enrico Scholz <
enrico.scholz@sigma-chemnitz.de> wrote:

> The 'systemctl disable' operation should not be done in postrm() because
> the .service file does not exist anymore and the script will fail hence.
>
> After moving this command into prerm(), postrm() becomes empty and can
> be removed completely.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Eric, this might be backported to denzil too IMO.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

