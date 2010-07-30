Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1OejuH-0003cX-MN
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 09:21:26 +0200
Received: by fxm12 with SMTP id 12so721969fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jul 2010 00:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=XGdNCwntDSDkvSO/1Cj9TqWxj6CUXAYYggS5MvyWhUI=;
	b=orYwpFf/i6l6swK50TyIFF4hrn6kJUkbL5rACkU/ZGQQBgXuhKeA0Cnh0wwT7xuUXM
	3mqCDIfHW30z5B7aLcmY9JU5Bb13WL3dDzKEaAjJ899inqSJfz3+77Y0kClKa546Z9C4
	Qfa0SOpE7m3gNfNai3MRj1RS1pwji/A9Mvlnw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FhUmhXrGguy31Vg+PPIsrkPN6TII98olxQbAckPT2M6Ch0ViWuhjK4H6jhEnSkdjab
	Meil5XWXHYy0hzbKmvlCa29amREAIFG9vd9KRIKVfcJyKgEQN7aTcf/wfIbL9TZPbtrh
	SKDQ7yhfvUfEzLXCj+NZEPiV172vzzldGPgrM=
MIME-Version: 1.0
Received: by 10.239.182.67 with SMTP id p3mr58257hbg.122.1280474463649; Fri, 
	30 Jul 2010 00:21:03 -0700 (PDT)
Received: by 10.239.181.207 with HTTP; Fri, 30 Jul 2010 00:21:03 -0700 (PDT)
In-Reply-To: <4C516EF8.3080804@balister.org>
References: <AANLkTimk_y-ntnLZpXfa_biLEcX_vO_Lk5PQXWPJcuec@mail.gmail.com>
	<i2rik7$ds1$1@dough.gmane.org> <4C516EF8.3080804@balister.org>
Date: Fri, 30 Jul 2010 09:21:03 +0200
Message-ID: <AANLkTikZQB39U7kUv9-0v-3gysX=tYFuwUiq3ygXJzAL@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE recipe tree quality
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
X-List-Received-Date: Fri, 30 Jul 2010 07:21:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 29, 2010 at 2:07 PM, Philip Balister <philip@balister.org> wrot=
e:
>
>
> On 07/29/2010 05:45 AM, Koen Kooi wrote:
>>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 29-07-10 10:50, Frans Meulenbroeks wrote:
>>>
>>> Dear all,
>>>
>>> Given the discussions on quality that sometimes pop up (and also
>>> triggered
>>> by Robert's message), I decided to kick off a bitbake -k world.
>>
>> Could you first explain to me why 'bitbake world' is a good way to
>> measure quality?
>>
>> I would think that building something like console-image and looking at
>> the following would be a much better metric:
>>
>> * does it build?
>> * are all the rootfs types working?
>> * does the image do what it is supposed to do?
>> * Are all the licenses of the output packages correct?
>> * Do the output packages have any spurious deps?
>> * Is the content of the output packages correct?
>> * Are there any known CVEs in the resulting packages?
>> * Did packaged-staging do its job?
>> * What kind of QA errors and warnings were raised?
>> * Did all recipes pass recipe_sanity?
>> * Did all recipes conform to oe-stylize.py?
>>
>> etc
>>
>> I would actually advocate removing the 'world' feature from bitbake/OE
>> to stop people from wasting time on looking at bitbake world and have
>> them fix actual problems.
>
> bitbake world seems to be the source of pointless listserv discussions. D=
oes
> it serve any purpose?

Pointless or not really depends on how you look at quality.

If you look at it as you, Koen and other OE long-timers, yes, it looks
rather pointless to have bitbake world.
But for those of us who have a different view on what quality is, then
bitbake world serves a purpose.
It can be used to get a rough picture of the current quality, and if
it were accepted, even use it to clean up OE and thus raise the
quality according to our quality measurement.

So the actual discussion that is popping up (again), what the common
quality goals for OE is.
And that should hopefully not be seen as a pointless discussion.
Hopefully, it will be a continous discussion, from now on and forever.

/Esben
--=20
Esben Haabendal, Senior Software Consultant
Dor=E9Development ApS, Ved Stranden 1, 9560 Hadsund, DK-Denmark
Phone: +45 51 92 53 93, E-mail: eha@doredevelopment.dk
WWW: http://www.doredevelopment.dk


