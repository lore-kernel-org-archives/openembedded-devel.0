Received: from [74.125.46.32] (helo=yw-out-2526.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ticktock35@gmail.com>) id 1Lpab0-0000Mx-8q
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 06:01:36 +0200
Received: by yw-out-2526.google.com with SMTP id 5so306884ywo.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Apr 2009 20:59:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.250.15 with SMTP id x15mr98243anh.21.1238731145135; Thu, 
	02 Apr 2009 20:59:05 -0700 (PDT)
Date: Thu, 2 Apr 2009 20:59:04 -0700 (PDT)
X-IP: 118.168.104.83
User-Agent: G2/1.0
X-HTTP-UserAgent: Mozilla/5.0 (X11; U; Linux i686; zh-TW; rv:1.9.0.8) 
	Gecko/2009032711 Ubuntu/8.10 (intrepid) Firefox/3.0.8, gzip(gfe),
	gzip(gfe)
Message-ID: <6b7bf6e9-f3cb-4460-b1dc-312bc0ced19e@j18g2000prm.googlegroups.com>
From: Tick <ticktock35@gmail.com>
To: opkg-devel <opkg-devel@googlegroups.com>
X-SA-Exim-Connect-IP: 74.125.46.32
X-SA-Exim-Mail-From: ticktock35@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=BAYES_40,RDNS_NONE,SPF_PASS,
	X_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [RFC] opkg conffiles force overwrite
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
X-List-Received-Date: Fri, 03 Apr 2009 04:01:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi All,
  I am pondering that let conf->force_overwrite in opkg enable
resolve_conffiles overwrite any conffiles. Now opkg will not overwrite
the conffiles even if you set force_overwrite. It will cause opkg ask
user to choose what to do to the conffiles if they are changed.

Adding another flag e.g. force_overwrite_conffile seems a little bit
superfluous and not orthogonal to force_overwrite. But it will not
change current opkg behavior.

Letting force_overwrite can overwrite conffiles will cause logical
change of this flag.  This will make opkg-cl asking nothing when
upgrade some conffiles if you set force_overwrite. It may cause users
lose their own setting without a second chance to save them?

In my own opinion, I prefer let force_overwrite flag can overwrite
files including conffiles, because it has to be set manually. But this
will change the behaviour of opkg, and may have some impact on other
projects. Such as OE. That makes me consider again and again.

My proposal is if conffiles been overwrited because force_overwrite
was set.
The old conffile XXXX will be move to XXXX~, and adding a warning
message of "overwriting conffile XXXX".
Is that a good solution?

any advice?

p.s. please reply to opkg-devel@googlegroups.com.

Cheers,
Tick


