Received: from [209.85.146.176] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwhoosier@gmail.com>) id 1IIlV8-0001y8-Vk
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Aug 2007 15:23:03 +0200
Received: by wa-out-1112.google.com with SMTP id l24so202465waf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Aug 2007 06:20:25 -0700 (PDT)
Received: by 10.115.61.1 with SMTP id o1mr157403wak.1186579224404;
	Wed, 08 Aug 2007 06:20:24 -0700 (PDT)
Received: by 10.114.73.7 with HTTP; Wed, 8 Aug 2007 06:20:24 -0700 (PDT)
Message-ID: <d543f5920708080620h171bb132o91d4aba695d9209@mail.gmail.com>
Date: Wed, 8 Aug 2007 08:20:24 -0500
From: "Matt Hoosier" <matt.hoosier@gmail.com>
Sender: mwhoosier@gmail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1186575579.6091.43.camel@localhost.localdomain>
MIME-Version: 1.0
References: <d543f5920708071623g37c9844fs47db2c11d73d1ec9@mail.gmail.com>
	<1186575579.6091.43.camel@localhost.localdomain>
X-Google-Sender-Auth: e44987d4cbaa0c8c
Cc: openembedded-devel@openembedded.org
Subject: Re: Inheriting conditionally
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
X-List-Received-Date: Wed, 08 Aug 2007 13:23:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 8/8/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> I can't think of a way to do this 100% neatly, the following is my best
> idea:
>
> SYSTEMWIDEDAEMON = "dummy"
> SYSTEMWIDEDAEMON_mydistro = "myspecialclass"
>
> inherit ${SYSTEMWIDEDAEMON}
>
> The ugly bit is it needs an empty dummy.bbclass.
>
> A quick test here suggests it might be harmless to use "base" there
> since base will always have already been included...
>

Thanks. I also got the "bright" idea to install a dummy init script
for any distribution other than mine:

do_install () {

  ...

  install -d -m 0755 ${D}${sysconfdir}/init.d
  if [ "${DISTRO}" = "foinse" ] ; then
      install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/pulseaudio
  else
      echo "#! /bin/sh" > ${D}${sysconfdir}/init.d/pulseaudio
      chmod 0755 ${D}${sysconfdir}/init.d/pulseaudio
  fi
}


