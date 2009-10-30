Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N3ubE-0002td-LH for openembedded-devel@lists.openembedded.org;
	Fri, 30 Oct 2009 17:45:19 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N3ua7-0007ec-K1
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Oct 2009 17:44:07 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2009 17:44:07 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2009 17:44:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 30 Oct 2009 17:43:40 +0100
Message-ID: <hcf53t$4jp$1@ger.gmane.org>
References: <ac9c93b10910300040v779f8446k31de3dfc2b2fe298@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <ac9c93b10910300040v779f8446k31de3dfc2b2fe298@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: about staging
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
X-List-Received-Date: Fri, 30 Oct 2009 16:45:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30-10-09 08:40, Frans Meulenbroeks wrote:
> Hi,
>
> Yesterday I ended up in a discussion on staging in #oe (ok, ok, I
> mainly caused the discussion :-) )
> Also based upon that I looked at various recipes on how people
> implement staging.
>
> There does not seem to be really standard way.
> Some recipes copy from ${S} which ihmo is not desirable; i think it
> should be a file that is exported by the application).
> Others use other mechanisms.
>
> For my own recipe I ended up with something like:
>
> do_stage() {
>          install -d ${STAGING_INCDIR}
>          install -d ${STAGING_INCDIR}/${PN}
>          install -m 0644 ${D}/${includedir}/${PN}/*.h ${STAGING_INCDIR}/${PN}
> }
>
> as that seems the best. ${D} contans the exported/installed files from
> the application. Those files are the ones the application wants to
> make externally available and those should end up in staging. Not
> something from ${S}.

Is ${D} garanteed to be present at staging time? I don't think we have a 
current hard rule for that.

regards,

Koen



