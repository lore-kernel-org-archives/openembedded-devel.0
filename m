Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1PdgbY-0007e8-Ct
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 11:10:00 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id p0EA9Pgu031881
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jan 2011 11:09:26 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>) id 1Pdgay-0001eo-Ed
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Jan 2011 11:09:25 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1294928503-25643-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<4D2FC07E.9020505@gmail.com>
Date: Fri, 14 Jan 2011 11:09:24 +0100
In-Reply-To: <4D2FC07E.9020505@gmail.com> (Khem Raj's message of "Thu, 13 Jan
	2011 19:18:22 -0800")
Message-ID: <lyzkr37q5n.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.6
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.71 on 62.153.82.30
Subject: Re: [PATCH] e2fsprogs: change mode of non-links only
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
X-List-Received-Date: Fri, 14 Jan 2011 10:10:00 -0000
Content-Type: text/plain; charset=us-ascii

Khem Raj <raj.khem@gmail.com> writes:

> alternatively you can exclude patches directory from feeding into
> chmod

I do not think that excluding a single, implementation specific directory
is a good idea. When this or a future package contains symlinks to outside
the buildroot, problem would be triggered again.

Doing blindly 'find | xargs chmod' is just wrong...

I will submit a new patch which executes 'chmod -R u=rwx .' (this does
not dereference symlinks) instead of using the find pipe.


>> -	find ./ -print|xargs chmod u=rwX
>> +	find ./ ! -type l -print|xargs chmod u=rwX



Enrico


