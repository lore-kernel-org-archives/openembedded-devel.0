Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OQlqP-0004I5-8d
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jun 2010 20:35:43 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.3) with ESMTP id o5LIV1dq000563
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 21 Jun 2010 20:31:01 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OQlls-0007Dm-BB; Mon, 21 Jun 2010 20:31:00 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Khem Raj <raj.khem@gmail.com>
References: <1276606987-8681-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<20100621182406.GA27606@gmail.com>
Date: Mon, 21 Jun 2010 20:31:00 +0200
In-Reply-To: <20100621182406.GA27606@gmail.com> (Khem Raj's message of "Mon,
	21 Jun 2010 11:24:06 -0700")
Message-ID: <lylja8qluj.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] ipkg-utils: convert mtime to int before comparing it
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
X-List-Received-Date: Mon, 21 Jun 2010 18:35:43 -0000
Content-Type: text/plain; charset=us-ascii

Khem Raj <raj.khem@gmail.com> writes:

> On (15/06/10 15:03), Enrico Scholz wrote:
>> The st_mtime attribute (which is a float) is compared against a value
>> from the timestamp database, which was stored as an integer there.
>
>
> Is it stored as integer or long int? Did you try it on x86_64 box.

As 'int'. The ipkg-make-index-track-stamps.patch stores them as

+    pkgsStamps[basename] = fnameStat.st_mtime
     ...
+    pkgsStampsFile.write("%d %s\n" % (pkgsStamps[f], f))

and reads them back as

+            s, f = l.split(" ", 1)
+            pkgsStamps[f] = int(s)


> -+          if pkgsStamps.has_key(basename) and fnameStat.st_mtime == pkgsStamps[basename]:
> ++          if pkgsStamps.has_key(basename) and int(fnameStat.st_mtime) == pkgsStamps[basename]:



Enrico


