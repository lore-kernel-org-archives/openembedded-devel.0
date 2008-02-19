Received: from [209.85.128.191] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JRTBy-0004Xk-F9
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2008 15:11:33 +0100
Received: by fk-out-0910.google.com with SMTP id 18so2653586fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2008 06:10:42 -0800 (PST)
Received: by 10.82.181.7 with SMTP id d7mr14296613buf.4.1203430242443;
	Tue, 19 Feb 2008 06:10:42 -0800 (PST)
Received: from widy.localdomain ( [88.231.76.37])
	by mx.google.com with ESMTPS id c22sm14274240ika.3.2008.02.19.06.10.35
	(version=SSLv3 cipher=OTHER); Tue, 19 Feb 2008 06:10:37 -0800 (PST)
Date: Tue, 19 Feb 2008 16:11:00 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-commits@lists.openembedded.org
Message-ID: <20080219161100.02282dfe@widy.localdomain>
In-Reply-To: <E1JRSFH-0007Gx-36@linuxtogo.org>
References: <E1JRSFH-0007Gx-36@linuxtogo.org>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.128.191
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] org.oe.dev package_ipkg.bbclass: Remove uneeded line, the anonymous python function sets this only in the case its needed (PACKAGES isnt empty)
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
X-List-Received-Date: Tue, 19 Feb 2008 14:11:36 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Tue, 19 Feb 2008 14:10:51 +0100
"rpurdie commit" <openembedded-commits@lists.openembedded.org> wrote:

> package_ipkg.bbclass: Remove uneeded line, the anonymous python
> function sets this only in the case its needed (PACKAGES isnt empty)
> 
> Author: rpurdie@openembedded.org
[]
> ============================================================
> --- classes/package_ipk.bbclass
> 1094aec718c676ccf9d8083a10b5fedde8494c1e +++
> classes/package_ipk.bbclass
> fdf9fdf2855198b24b017026dd3777995b2977d2 @@ -313,5 +313,4 @@
> do_package_write_ipk[dirs] = "${D}"
> bb.build.exec_func("do_package_ipk", d) } do_package_write_ipk[dirs]= "${D}" 
> -do_package_write_ipk[depends]="ipkg-utils-native:do_populate_staging" 
> addtask package_write_ipk before do_package_write after do_package

And still I somehow hit a case when for 'generic'-based distro there
was some trouble with that. Just FYI, I don't remember details. Will
retry later.

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


