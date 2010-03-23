Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1Nu9fT-0003RO-Cq
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 20:21:35 +0100
Received: by wyb28 with SMTP id 28so3151733wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 12:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=3AbIdlkYEI1ak8ePTwScUYKqnH57eEq+Xd5/wOYh0js=;
	b=rzu/9Mo1Mcci4t83JUze6ugKg4nJFwX8dr0iw9H/4NWKfUYw1CSS79LCSlP9seEfcy
	mMbVvPN+aamRJ336Lea6/6dmw1epBbTBjw0hdShwLI21nVnRLfXbhNm6ZxDMOCv4j36Q
	oBUZHszGsidK3dWLiqw61rblR91NUMG9KRQh8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tH0vywXLZiRv/DSPSt/B72Kkw5e3nnu6W1bkhWOzJ2MUxs8e1hnsIQaySTbp+Qxgna
	Bq8OcehkUmfCLXx2nDR5RHqrhj2smohpxV1fUti9GFA9koyFndPLK90PcWkQhhylomOY
	hJl+v5MOsgdpeQw2NpUi8tUUj8oxcFVN+nhpM=
MIME-Version: 1.0
Received: by 10.216.86.200 with SMTP id w50mr3579784wee.173.1269371906381; 
	Tue, 23 Mar 2010 12:18:26 -0700 (PDT)
In-Reply-To: <48239d391003221307u298b392m76fc618cec2c44c0@mail.gmail.com>
References: <48239d391003221307u298b392m76fc618cec2c44c0@mail.gmail.com>
Date: Tue, 23 Mar 2010 22:18:26 +0300
Message-ID: <48239d391003231218g3d928ba4r4ddb6d13d023b172@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: slapinid@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: sysklogd vs busybox
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
X-List-Received-Date: Tue, 23 Mar 2010 19:21:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 22, 2010 at 11:07 PM, Sergey Lapin <slapinid@gmail.com> wrote:
> Hi, all!
>
> For some of my images I need to have normal syslogd/klogd instead
> of ones provided by busybox. I don;t want to have special version of
> busybox for these images,
> but it RRECOMMENDS busybox-syslog which contains config files and init script.
>
> A problem is that these files are incompatble with normal syslogd/klogd pair.
> when I set RCONFLICTS = "busybox-syslog", sysklogd never appears in image.
> How could I force it in (and busybox-syslog out) without too much changes
> in complex busybox recipes (which I don't want to touch since that
> could preak something
> for somebody)?
As I found BAD_RECOMMENDATIONS = "busybox-syslog" doesn't fix this problem :(


>
> All the best,
> S.
>


