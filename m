Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1Ttdth-00041R-K5
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jan 2013 13:39:57 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r0BCOQVp027219
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2013 13:24:27 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>) id 1Ttdes-0002KF-9o
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jan 2013 13:24:26 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <20130109101310.38A4C103A7@opal>
	<CAGiJk9fX-W=P_5z_e45NwU+Nj3CSc4ozdS3_WyVyVtQyEWc5bw@mail.gmail.com>
Date: Fri, 11 Jan 2013 13:24:26 +0100
In-Reply-To: <CAGiJk9fX-W=P_5z_e45NwU+Nj3CSc4ozdS3_WyVyVtQyEWc5bw@mail.gmail.com>
	(Samuel Stirtzel's message of "Fri, 11 Jan 2013 11:45:47 +0100")
Message-ID: <lyobgvykjp.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Re: Khem Raj : dhcp: Add systemd unit file for dhclient
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
X-List-Received-Date: Fri, 11 Jan 2013 12:39:57 -0000
Content-Type: text/plain

Samuel Stirtzel <s.stirtzel-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
writes:

>> +ExecStart=/sbin/dhclient -cf /etc/dhcp/dhclient.conf -q $INTERFACES -lf /var/lib/dhcp/dhclient.leases
> ...
> systemd[1]: PID file /var/run/dhclient.pid not readable (yet?) after start.
> [FAILED] Failed to start Dynamic Host Configuration Protocol (DHCP).
> See 'systemctl status dhclient.service' for details.
>
>
> Any idea why it is missing?

probably a '--no-pid' option


Enrico


