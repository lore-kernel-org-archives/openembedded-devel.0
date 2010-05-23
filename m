Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OGIKP-00080y-Kz
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 23:03:22 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o4NKx7Vk022280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 23 May 2010 22:59:07 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1OGIGJ-0002ZA-6A; Sun, 23 May 2010 22:59:07 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: pieterg <pieterg@gmx.com>
References: <a4b71a86a14f591edb468e79e6ed9d13dda96958.1274642314.git.enrico.scholz@sigma-chemnitz.de>
	<712988cd3a458edd17b46a35ae1a82969c45e4dc.1274642314.git.enrico.scholz@sigma-chemnitz.de>
	<201005232210.18644.pieterg@gmx.com>
Date: Sun, 23 May 2010 22:59:07 +0200
In-Reply-To: <201005232210.18644.pieterg@gmx.com> (pieterg@gmx.com's message
	of "Sun, 23 May 2010 22:10:18 +0200")
Message-ID: <ly39xijpwk.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
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
Subject: Re: [PATCH 3/3] freetype: enable bytecode interpreter
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
X-List-Received-Date: Sun, 23 May 2010 21:03:22 -0000
Content-Type: text/plain; charset=us-ascii

pieterg <pieterg@gmx.com> writes:

>> Bytecode stuff is patent encumbered so it can be enabled for
>> non-enterprise distributions only.
>
> The bytecode patents have expired, 

afaik (I am not a lawer) that's only true for the second part
(TT_CONFIG_OPTION_BYTECODE_INTERPRETER) of the patch.  The ClearType
patents (which are violated by FT_CONFIG_OPTION_SUBPIXEL_RENDERING) were
filed in 1999 and are probably still valid.

I should have been clearer in the patch description and mention that it
enables also subpixel rendering.


Enrico


