Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1JcSSt-0003pz-MD
	for openembedded-devel@openembedded.org; Thu, 20 Mar 2008 22:38:25 +0100
Received: by an-out-0708.google.com with SMTP id b38so258570ana.6
	for <openembedded-devel@openembedded.org>;
	Thu, 20 Mar 2008 14:38:16 -0700 (PDT)
Received: by 10.100.133.20 with SMTP id g20mr6829503and.2.1206049096929;
	Thu, 20 Mar 2008 14:38:16 -0700 (PDT)
Received: by 10.101.71.14 with HTTP; Thu, 20 Mar 2008 14:38:16 -0700 (PDT)
Message-ID: <bdb0025f0803201438v1950602ci25b2b4d54ad359f@mail.gmail.com>
Date: Thu, 20 Mar 2008 18:38:16 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@openembedded.org
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.132.247
X-SA-Exim-Mail-From: rodrigo.vivi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: problems when using overrides...
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
X-List-Received-Date: Thu, 20 Mar 2008 21:38:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi there,

I'm trying without success to use
BB_NUMBER_THREADS_icecc = "8" in my local.conf

I've already checked with mickeyl help that all variables are set correctly:

OVERRIDES="local:icecc:nokia800:mamona:linux-gnueabi:arm:build-linux:fail-fast:pn-bitbake"

BB_NUMBER_THREADS="8"

but it is not working...

It starts only one thread. But when I remove the "_icecc" it really
starts 8 threads.

Does someone have any idea?

Holger? Richard?

btw I'm trying to set up other 3 variables with this icecc overrides:

PARALLEL_MAKE_icecc
INHERIT_append_icecc
ICECC_ENV_EXEC_icecc

but no one seems to be working...

Thanks in advance

-- 
Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net


