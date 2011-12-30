Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Rgego-00047E-0t
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 16:48:14 +0100
Received: by eaal1 with SMTP id l1so12545931eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 07:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Sk8fB+f3wd8lj4nCnU7XMjF9UqHdJYNeRDK98zT5c9Q=;
	b=alDuac05rwKFA1sbwrCQtUQ5RVWw/wCnOmIKd8HE1bqghCVs6QNe5nw/oVkSX82WY/
	wfJeTL5Qf4N3Gz6yfKw/PqsdPcgx6YGeZm1QryLhzRc3rigpoUTXUundr9T+CqgIGz/8
	sODa8BtAoZ4PtrJLO+4qfgDrdrIepgt3agcwY=
MIME-Version: 1.0
Received: by 10.205.143.18 with SMTP id jk18mr9319583bkc.1.1325259658107; Fri,
	30 Dec 2011 07:40:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.78.79 with HTTP; Fri, 30 Dec 2011 07:40:58 -0800 (PST)
In-Reply-To: <20111230125446.GG16885@jama.jama.net>
References: <cover.1325248824.git.otavio@ossystems.com.br>
	<2eaa23a3419bfd9b5aea6c1f059242a38eb03608.1325248824.git.otavio@ossystems.com.br>
	<20111230125446.GG16885@jama.jama.net>
Date: Fri, 30 Dec 2011 13:40:58 -0200
X-Google-Sender-Auth: LEO5XiU5072END7K3dgfD_T0RtQ
Message-ID: <CAP9ODKpHT8YA63BH3CjkDeeQHfr9uGGuD5+WC7BSJXHZkjFg_g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH 1/3] xserver-nodm-init: move systemd service to xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 30 Dec 2011 15:48:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 30, 2011 at 10:54, Martin Jansa <martin.jansa@gmail.com> wrote:

> I haven't tried but isn't this ^ overwritting systemd runtime dependency
> set by systemd.bbclass? += would be probably bette if it's the case.
>

Got catch, indeed.

Thanks. Fixed locally.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

