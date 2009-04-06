Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lqt8V-0005XG-OC
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 20:01:35 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lqt5k-00021X-Vd
	for openembedded-devel@openembedded.org; Mon, 06 Apr 2009 17:58:41 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 06 Apr 2009 17:58:40 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 06 Apr 2009 17:58:40 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 06 Apr 2009 19:58:30 +0200
Message-ID: <grdfs6$flp$1@ger.gmane.org>
References: <49DA2F2C.60008@bolloretelecom.eu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <49DA2F2C.60008@bolloretelecom.eu>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] make "LDFLAGS ignored" QA errors fatal
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
X-List-Received-Date: Mon, 06 Apr 2009 18:01:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06-04-09 18:34, Jeremy Lainé wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> I have spent quite some time cleaning up a bunch of recipes which were
> triggering "LDFLAGS ignored" QA errors, and I don't really want to
> have to do this again in the future. I suggest we stop whitelisting
> this kind of QA error, using the attached patch.
>
> To track down the faulty packages I have made use of oestats output
> (note that not all QA errors are "LDFLAGS ignored"):
>
> http://tinderbox.openembedded.net/packages/?qalog=1
>
> In most cases, the problem is that recipes simply pass
> - -L${STAGING_LIBDIR} as LDFLAGS instead of using the full ${LDFLAGS}
> variable. The result is that flags such as --hash-style=gnu are
> getting ignored.
>
> What are your thoughts?

I think making them fatal is a good idea. I do have some recipes where I 
can't fix LDFLAGS properly yet, but I can do INSANE_SKIP = 1 inside 
those for the time being.

So: +1

regards,

Koen



