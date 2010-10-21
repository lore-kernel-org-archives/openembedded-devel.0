Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P8rwm-0001sE-GL for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 12:00:33 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P8rwB-0008Aj-DU for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 11:59:55 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 11:59:55 +0200
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 11:59:55 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 21 Oct 2010 11:59:42 +0200
Message-ID: <i9p2uf$f40$1@dough.gmane.org>
References: <i9p1d0$7q4$1@dough.gmane.org> <4CC00D57.4070601@xora.org.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <4CC00D57.4070601@xora.org.uk>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Thu, 21 Oct 2010 10:00:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 21-10-10 11:52, Graeme Gregory wrote:
> On 21/10/2010 10:33, Koen Kooi wrote:
>> Hi,
>>
>> Recipes/linux is a mess and recipes/u-boot is as well. It would be a
>> nice topic for OEDEM to see if we discuss switching to a poky BSP model.
>> It would boil down to:
>>
>> 1 base bblayer with shared files:
>> * conf/machine/include
>> * recipes/linux/*.inc
>>
>> 1 bblayer per machine or SOC_FAMILY containing:
>> * machine.conf
>> * first and second stage bootloaders
>> * kernel
>>
>> So, what are peoples thoughts on this? I haven't thought this through
>> myself, so feel free to point out any show stoppers.
>> I do not want this to turn into a "splitting the metadata" discussion,
>> while I'm all for that, it really is a seperate effort and discussion.
>> But any bblayer style split would benefit from OE being a collection of
>> git submodules instead of a monolithic tree[1].
>>
>> Regards,
>>
>> Koen
>>
>> [1] Provided git submodules stop sucking so hard in future git versions
> This is something I have advocated before but never formally presented a
> RFC to OEDEM.
> 
> With this model it quickly becomes clear which machines have support.
> 
> The only problem comes with BLAH_machine type overides. Are they done as
> amend.inc (or whatever the current method is) in overlay or are they
> allowed into main repo. I think amend.inc in this case is probably the
> way to go.

The downside of amend.inc is the de-sync when the recipe gets updated,
but not the overlay. You run the risk of using a version without the
overrides that way.
Maybe some fancy scripts, (pre-)commit hooks or just old fanishioned
review on the ml could solve those type of issues.

How do file overrides like
recipes/netbase/netbase/beagleboard/interfaces get handled in a
bblayer/amend.inc world?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMwA8OMkyGM64RGpERAlSFAJwMPvcXiGBMWqIspIaG+TLzpohAaQCfVUVy
hWVW4K67s6Drr381HtpIc+w=
=OSYR
-----END PGP SIGNATURE-----



