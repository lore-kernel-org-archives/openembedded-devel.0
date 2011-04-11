Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1Q9FLq-0008Rj-3t
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Apr 2011 13:32:14 +0200
Received: by iye7 with SMTP id 7so5943252iye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Apr 2011 04:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=A/R6YGmOfLA6dXm4OxdZmqGWPn2SdrGAuONmYMLVi4w=;
	b=OSkgJxSU6dzjEbmkofVjlcBPpxluNwyazsAv0FI9kz2N8OxdtAvxst+gd244VcoQcl
	0Q3mmAX6jT03fOGTwKaevHdRQ9ydjwzuRwdZuulisVSIQLjrL4XwLPU54azfUeFCMcbS
	8eoXFAyPert3xdV87myHoiGASat1ceSRqFHXg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=JiWinYReI1Id+QyaK1+KLz5zK/R7Dcwhd/j8wgIRXO8GKLwz4HD/XEWN46eA9FAgzR
	Gb4oFaZxMdZ2tmclRduN+ftUdhZVS3+M3y6hzY0sG4sbGMMt+eLWb9x5KeGZFqelAprh
	fvi4tf6lwkbg/fd3L6mBWR8NO0qJnIqZCM3to=
MIME-Version: 1.0
Received: by 10.42.171.8 with SMTP id h8mr7007096icz.453.1302521398638; Mon,
	11 Apr 2011 04:29:58 -0700 (PDT)
Received: by 10.42.114.80 with HTTP; Mon, 11 Apr 2011 04:29:58 -0700 (PDT)
In-Reply-To: <20110411105712.GA5626@excalibur.local>
References: <1302456441-3417-1-git-send-email-anders@chargestorm.se>
	<20110411080125.GB28101@jama.jama.net>
	<1217FED4-A7EC-4603-9CD7-19BEA0827E96@chargestorm.se>
	<20110411105712.GA5626@excalibur.local>
Date: Mon, 11 Apr 2011 13:29:58 +0200
Message-ID: <BANLkTikvA5bhUTJ0NhKXn158Y5RhZ8V-_g@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] lowpan-tools_0.2.2; : fix build with static libnl1
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
X-List-Received-Date: Mon, 11 Apr 2011 11:32:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On Mon, Apr 11, 2011 at 12:57, Stefan Schmidt <stefan@datenfreihafen.org> wrote:
> On Mon, 2011-04-11 at 11:08, Anders Darander wrote:
>> I'll try to make a somewhat better explanation in the included patch during the evening, and I can also remove the PR bump before submitting a third revision of the patch. Hopefully I can find some time this evening.
>
> Thanks for this. I will test your patch and push it out after this.

Thanks, I make sure to send a v3 this evening (at the latest tomorrow evening).

> While I still want to get lowpan-tools fixed for libnl2 I think this
> is a good solution for the current releases.

Yes, I agree with you that the correct fix is to update lowpan-tools
to use libnl2. However, due to time constraints, we opted for the
interim solution.

Regards,
Anders


