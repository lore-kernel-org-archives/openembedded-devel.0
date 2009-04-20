Received: from [72.14.220.157] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <brandhetlampje@gmail.com>) id 1Lvp4U-0007el-KJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Apr 2009 10:41:46 +0200
Received: by fg-out-1718.google.com with SMTP id e12so201012fga.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Apr 2009 01:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=mUsrWlKc52aIOHYTRU85Ef57HnylAzeh0odIsPiKuP8=;
	b=QBtSH3ni1jcdjfaIKfLZurOJHFoYGljQqXWIWqFlO8i1nRDuC3PqFFeaCL4eVz3zK4
	vVWbcMDfEuee5vkc/TK+389iBGFhSv3FoOncSkg+sTSsd9nqh86ZhRhv+bz7tScnikBA
	2lQhlXssSfZk5vldYu5dRp0awFZntupyJ+LmE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=FcX3g6TMGyRDkMyjOLk+RPddEOIE3osJa1RbZgy3/yGmCauHcdlv+QUFeOe4jw99cU
	hub2MqEVxIR5y7196X6aqI0/Eu1CQAd7HV8lF5YqVu0rN96XTsHqOwp6JgAo37xNr6Sl
	iqccqM9VqCOFzZ/zRn+Ll+AIp1KgH54tld5ig=
MIME-Version: 1.0
Received: by 10.86.90.2 with SMTP id n2mr3799711fgb.61.1240216648970; Mon, 20 
	Apr 2009 01:37:28 -0700 (PDT)
In-Reply-To: <49EC26E1.8020909@gmail.com>
References: <49EB6F02.1030402@gmail.com>
	<6978a1740904192319w5ed4ec4bs4c854ecdc540aaa4@mail.gmail.com>
	<49EC26E1.8020909@gmail.com>
Date: Mon, 20 Apr 2009 10:37:28 +0200
Message-ID: <6978a1740904200137u7d7c4e9eg8f13392587dafd4a@mail.gmail.com>
From: s hakkesteegt <brandhetlampje@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: devshell not working with screen remote shell
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
X-List-Received-Date: Mon, 20 Apr 2009 08:41:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Marco,

That's correct, I do use a similar setup.

After you get the message 'task-do_devshell: started', you should open a new
ssh session to your server (in a different console) and you can see there
with 'screen -list' that a new screen session has opened, next to the first
screen session where you executed the bitbake command. Attach to the new
screen session (screen -r). Then you've arrived in the devshell.

When you're ready in the devshell, close it with exit, and the bitbake in
your first screen session will continue .

Siebren (irc: tsjsieb)




On Mon, Apr 20, 2009 at 9:40 AM, Marco Cavallini <koansoftware@gmail.com>wrote:

> s hakkesteegt ha scritto:
> > You might want to add this to your local.conf
> >
> > TERMCMD = "${SCREEN_TERMCMD}"
> > TERMCMDRUN = "${SCREEN_TERMCMDRUN}"
> >
> > devshell will open in a new screen session, witch you can attach to
> > manually.
> >
>
> Siebren,
> thank you for answering.
> I am using a remote ssh connection to the OE development server and I
> use screen package inside it.
> I tried adding your lines and now the build stops here
>
>  NOTE: package bluez-utils-3.36-r5: task do_devshell: started
>
> but nothing happens.
>
> Are you using this with the same conditions (remote ssh + screen) or
> locally?
>
> /marco
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

