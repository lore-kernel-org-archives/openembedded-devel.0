Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sakoman@gmail.com>) id 1OwS4n-0007vq-8g
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Sep 2010 06:00:11 +0200
Received: by wwi14 with SMTP id 14so2335798wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 20:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lf+wFrOrFg/v3+L9Jttf9ZlEEfWF59uaelbx9Qkyus8=;
	b=qAuWYZKElKngIdiY3rRRPC9SDMpSkF3+/RmtWOG8/aIsZsRtr2LmU8+bRPtN46tl09
	1WTx+S7SCrGd+CsfoCXvQl+Fr1h1d40S9TlxO+7sysI+MFX7ZdhfMwtI0DzZW/uaeTte
	XolCCAqDa8uwA6+sXVLxpYnjvaWqfLxRX2o+E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=KItC6jIGBYvOKIJqmGpVgsrwzdI8P+wa7UsPZnGbq0bJvo8dbx16cnUOgI9xPtgyU0
	ECggDf98zxTQE7vuIMgW4Aobe6pqO49QhTsnmXXlr9dm/qGXAuq32Cfu0GATfQPh6Pn/
	s5A1272NgkFPLHMOt93Zvk8zmc66bWhjQIUfc=
MIME-Version: 1.0
Received: by 10.216.12.8 with SMTP id 8mr211908wey.107.1284695783197; Thu, 16
	Sep 2010 20:56:23 -0700 (PDT)
Received: by 10.216.72.199 with HTTP; Thu, 16 Sep 2010 20:56:23 -0700 (PDT)
In-Reply-To: <AANLkTinQbPD21+gAvEoBEn3KaPUvz3cK4u9+LjkL1JqC@mail.gmail.com>
References: <AANLkTikYsro5b_6S9NKSyPWC0DMMr9A9zKyL0qXF53Zs@mail.gmail.com>
	<4C91D544.7070702@dresearch.de>
	<AANLkTinQbPD21+gAvEoBEn3KaPUvz3cK4u9+LjkL1JqC@mail.gmail.com>
Date: Thu, 16 Sep 2010 20:56:23 -0700
Message-ID: <AANLkTinb2TrxJtgb5T6eQXOM6obNmBq-moJBfeCm_1-j@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: sakoman@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: melo git outage
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
X-List-Received-Date: Fri, 17 Sep 2010 04:01:47 -0000
X-List-Received-Date: Fri, 17 Sep 2010 04:01:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 16, 2010 at 1:51 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/9/16 Steffen Sledz <sledz@dresearch.de>:
>> Am 15.09.2010 22:32, schrieb Tom King:
>>> In approximately 1hr 21:30UTC I need to rsync the server to create a ba=
ckup
>>> and perform an upgrade to the melo server so that we can add some addit=
ional
>>> functionality.
>>>
>>> I suspect that the rsync and upgrad will take approx 2-3hrs (to fix thi=
ngs
>>> that break)
>>
>> No yet back again. :(
>>
>>> git pull
>> git.openembedded.net[0: 140.211.169.165]: errno=3DConnection refused
>> fatal: unable to connect a socket (Connection refused)
>>
>> Steffen
>
> Here it works:
>
> frans@frans-desktop:~/workspace/openembedded.git$ git pull
> remote: Counting objects: 9, done.
> remote: Compressing objects: 100% (5/5), done.
> remote: Total 5 (delta 3), reused 0 (delta 0)
> Unpacking objects: 100% (5/5), done.
> From git.openembedded.org:openembedded
> =A0 23e6589..6aa0766 =A0master =A0 =A0 -> origin/master
> =A0 23e6589..6aa0766 =A0org.openembedded.dev -> origin/org.openembedded.d=
ev
> Updating 23e6589..6aa0766
> Fast-forward
> =A0recipes/nodejs/nodejs_0.2.1.bb | =A0 23 ++++++++++++++---------
> =A01 files changed, 14 insertions(+), 9 deletions(-)

Unfortunately for many others it is still broken:

steve@www:~/openembedded$ git pull
git.openembedded.org[0: 140.211.169.165]: errno=3DConnection refused
fatal: unable to connect a socket (Connection refused)

Is anyone working on this?

Steve


