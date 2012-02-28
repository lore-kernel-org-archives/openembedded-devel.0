Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1S2JSG-0002Q1-MU
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 10:34:44 +0100
Received: by bkcjg15 with SMTP id jg15so2128416bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 01:26:17 -0800 (PST)
Received-SPF: pass (google.com: domain of sledz@dresearch-fe.de designates
	10.204.132.72 as permitted sender) client-ip=10.204.132.72; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sledz@dresearch-fe.de
	designates 10.204.132.72 as permitted sender)
	smtp.mail=sledz@dresearch-fe.de
Received: from mr.google.com ([10.204.132.72])
	by 10.204.132.72 with SMTP id a8mr7840828bkt.42.1330421177519 (num_hops
	= 1); Tue, 28 Feb 2012 01:26:17 -0800 (PST)
Received: by 10.204.132.72 with SMTP id a8mr6280499bkt.42.1330421177294;
	Tue, 28 Feb 2012 01:26:17 -0800 (PST)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id x11sm29816631bkd.2.2012.02.28.01.26.16
	(version=SSLv3 cipher=OTHER); Tue, 28 Feb 2012 01:26:17 -0800 (PST)
Message-ID: <4F4C9DB8.5050203@dresearch-fe.de>
Date: Tue, 28 Feb 2012 10:26:16 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Enigmail-Version: 1.3.5
X-Gm-Message-State: ALoCoQnGyAloFz2aNOWJJtaZFf3TcRiDLBNEykfuOyiDqR6DI9HrRapFHbpdUqn7oIJ73i7njzZB
Subject: Use python in variable assigment of a recipe
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
X-List-Received-Date: Tue, 28 Feb 2012 09:34:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

According to the user manual it is possible to use python code in variable assignments by using ${@...}.

I like to use a function (subprocess.check_output) here which requires an import statement. Where do i have to place this import?

And another question. Is it possible to determine the path to the recipe itself from with it?

Thx,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


