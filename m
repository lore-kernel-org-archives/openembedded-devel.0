Received: from [64.233.162.237] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1IEBnC-0006OM-7a
	for openembedded-devel@openembedded.org; Fri, 27 Jul 2007 00:26:46 +0200
Received: by nz-out-0506.google.com with SMTP id q3so519677nzb
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Jul 2007 15:25:23 -0700 (PDT)
Received: by 10.114.151.13 with SMTP id y13mr2271462wad.1185488722554;
	Thu, 26 Jul 2007 15:25:22 -0700 (PDT)
Received: by 10.115.75.15 with HTTP; Thu, 26 Jul 2007 15:25:22 -0700 (PDT)
Message-ID: <bdb0025f0707261525h67245c9dmb1f7dd0271570149@mail.gmail.com>
Date: Thu, 26 Jul 2007 19:25:22 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
Subject: update-alternatives problems
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
X-List-Received-Date: Thu, 26 Jul 2007 22:26:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I have some doubts about the update-alternatives scheme.

Why to have 2 ways to create an update-alternatives entry in the
postinst script? One is setting ALTERNATIVES_* variables inheriting
the update-alternatives.bbclass and the other is to write the function
 pkg_postinst_${PN} () containing the update-alternatives commands.
What is the big difference?

For example in sysvinit_2.86.bb there are both methods.
ALTERNATIVES_* for init
and the function for {halt,reboot,shutdown,last,mesg,wall}

I believe that there is a good reason for that, but what I believe
that is wrong is:

when using the ALTERNATIVES_* the path is ritght like in the init case
ALTERNATIVE_PATH = ${base_sbindir}/init.sysvinit
so this is the right update-alternatives command in postinst script:
update-alternatives --install /sbin/init init /sbin/init.sysvinit 50

But when in function the path are wrong (it aren't complete):
update-alternatives --install ${base_sbindir}/halt halt halt.${PN} 200
So the line in postinst script is that:
update-alternatives --install /sbin/halt halt halt.sysvinit 200
instead of a complete one
update-alternatives --install /sbin/halt halt /sbin/halt.sysvinit 200

Someday in past I've noticed that all of my links of
update-alternatives was broke  because this incomplete path so I did a
patch to update-alternatives-dpkg package to take the begin of path
(/sbin) for the link one (/sbin/halt) generating a path link
/sbin/halt.sysvinit fixing all cases that I knew. It was working fine
until today when I saw that my init link was pointing to
/sbin//sbin/init.sysvinit and breaking my initialization.

I believe that you don't have this error because update-alternatives
of ipkg works different, right?

What do you believe that is better? change all bb to have a standard?
or code a patch of my patch to make update-alternatives-dpkg check if
the path is right before try to get the begin of the link?

Regards

Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net


