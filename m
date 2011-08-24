Received: from moutng.kundenserver.de ([212.227.126.186])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eng1@koblersystems.de>) id 1QwJoN-0000Jc-Bp
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Aug 2011 22:12:31 +0200
Received: from [192.168.1.34] (p57B415EC.dip0.t-ipconnect.de [87.180.21.236])
	by mrelayeu.kundenserver.de (node=mreu4) with ESMTP (Nemesis)
	id 0LmRkt-1RVvQb3RPX-00aBEx; Wed, 24 Aug 2011 21:43:43 +0200
Message-ID: <4E555468.6070201@koblersystems.de>
Date: Wed, 24 Aug 2011 21:43:36 +0200
From: Jan Kobler <eng1@koblersystems.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20110120 Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1309803629.20865.8.camel@BTW1>	<CA+2YH7uyJUNWuvcNEC5jnsqkZs9Hnri7sxq0aZXWf1r88tU_qw@mail.gmail.com>	<1309850758.24550.19.camel@BTW1>	<CAG4_upTf2tNbusXcBs91dwf9TE+C9yxSmDM-nXc7wHsSHYDhyQ@mail.gmail.com>
	<1309860631.20533.4.camel@BTW1>
In-Reply-To: <1309860631.20533.4.camel@BTW1>
X-Provags-ID: V02:K0:1MY+b0NEsU4ZRWbFMGR/U95cvRzlC6hRBzU+yc/tr4I
	QyJzeXIspKg39QJztzg+DuXBlq/Z4bdF9PVBjGv8Rskhe4uw4Q
	4iufBI2zjZVMkvJdK2WNvQvtUu3l7qXg2GvDDpOkFDzxJHk9c/
	fvz2l3/0lIkamHoQ+HAmc0qqgWp66qYXpdP/bxqh7Ask6bX5w5
	E3ZfjcnT+HuGAf/wW54vQ==
Cc: Alessandro Sappia <a.sappia@biotechware.com>
Subject: Re: Cannot compile helloworld-image
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
X-List-Received-Date: Wed, 24 Aug 2011 20:12:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I have encountered the problem with the missing gl_GLIBC21 too.

This is what solved the problem for me:

bitbake -c clean gettext-native
bitbake gettext-native

Afterwards the string "GLIBC21" appears in
sysroots/x86_64-linux/usr/share/aclocal/glibc21.m4 and
sysroots/x86_64-linux/usr/share/aclocal/intl.m4

Best regards,

Jan


on 05.07.2011 12:10 Alessandro Sappia said the following:
> 
> but compilation fails on bison-native.
> 
> Seem solved by using the host bison ASSUME_PROVIDED += "bison-native"
> instead of let bitbake compile
> (bison from recipes complains about a "perhaps missing m4 macro
> gl_GLIBC21").
> 


