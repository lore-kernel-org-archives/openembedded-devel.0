Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PFBpj-0005OL-Nd
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 21:27:24 +0100
Received: by qyk4 with SMTP id 4so609523qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Nov 2010 12:26:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.217.83 with SMTP id hl19mr4440158qcb.15.1289161587406;
	Sun, 07 Nov 2010 12:26:27 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.95.74 with HTTP; Sun, 7 Nov 2010 12:26:27 -0800 (PST)
X-Originating-IP: [93.81.138.62]
Date: Sun, 7 Nov 2010 23:26:27 +0300
X-Google-Sender-Auth: w47p8jiaKCMaM5DBF1Fzw75K8sI
Message-ID: <AANLkTi=Kp6Ydc_HR0apO3abN7Zokd6SHazYQYY4vNkdo@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: bitbake goes crazy when ...
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
X-List-Received-Date: Sun, 07 Nov 2010 20:27:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello!

Bitbake fails without any end-user readable diagnosting (just a lot of
strange errors and tracebacks) when:
1) specifying non-existent DISTRO (I've mistyped and specified
'angsrom-2008.1' instead of 'angstrom')
2) specifying non-absolute path to TMPDIR (i.e. you can't use './tmp' as TMPDIR)

I've found this when playing with my testbuilder script.

Can/should we catch that errors and produce user-readable messages about this?

-- 
Yury Bushmelev


