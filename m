Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1OzVFa-0002tQ-OR
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Sep 2010 15:57:17 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id o8PDudN9014186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 15:56:40 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.72) (envelope-from <ensc@sigma-chemnitz.de>) id 1OzVF0-00073o-TL
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Sep 2010 15:56:38 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <4C9D0872.5060404@cbnco.com> <20100924220256.GA3423@jama>
Date: Sat, 25 Sep 2010 15:56:38 +0200
In-Reply-To: <20100924220256.GA3423@jama> (Martin Jansa's message of "Sat, 25
	Sep 2010 00:02:56 +0200")
Message-ID: <ly4odeexk9.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Scanned-By: MIMEDefang 2.68 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: nano RRECOMMENDS ncurses-terminfo
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
X-List-Received-Date: Sat, 25 Sep 2010 13:57:17 -0000
Content-Type: text/plain; charset=us-ascii

Martin Jansa <martin.jansa@gmail.com> writes:

>> +# actually RDEPENDS, but ncurses-terminfo is only in ncurses-5.7, so 
>> RRECOMMENDS for now
>> +RRECOMMENDS_${PN} = "ncurses-terminfo"
>> ...
>> Is there something special in ncurses-terminfo 5.7 that nano needs?
>
> There wasn't any common /etc/terminfo in base ncurses-5.7 package and I
> guess it's still isn't. 

There was added a 

+RSUGGESTS_${PN}-libtinfo = "${PN}-terminfo"
+RRECOMMENDS_${PN}-libtinfo = "${PN}-terminfo-base"

a month ago which should install these dependencies.


Enrico


