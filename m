Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TRlIA-0008Py-Gs
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 16:53:46 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id q9QEZEiA016717
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 26 Oct 2012 16:35:15 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TRl0D-0005RI-N7; Fri, 26 Oct 2012 16:35:14 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1351241920-15135-1-git-send-email-martiert@gmail.com>
	<1351241920-15135-2-git-send-email-martiert@gmail.com>
Date: Fri, 26 Oct 2012 16:35:13 +0200
In-Reply-To: <1351241920-15135-2-git-send-email-martiert@gmail.com> (Martin
	Ertsaas's message of "Fri, 26 Oct 2012 10:58:40 +0200")
Message-ID: <lybofpuwri.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.9
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Subject: Re: [meta-systemd][PATCH v2 2/2] meta-systemd: ntp: Fix starting of ntpdate.service
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
X-List-Received-Date: Fri, 26 Oct 2012 14:53:46 -0000
Content-Type: text/plain

Martin Ertsaas <martiert@gmail.com> writes:

>  Type=oneshot
> -ExecStart=/usr/bin/ntpd -q -g -x
> +ExecStart=/usr/bin/ntpdate pool.ntp.org

This should be made configurable. E.g.

  Environment=NTPHOSTS=pool.ntp.org
  EnvironmentFile=-/etc/sysconfig/ntp.conf
  ExecStart=/usr/bin/ntpdate $NTPHOSTS


Enrico


