Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PKSDh-00057m-Nk
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 09:57:54 +0100
Received: by iwn38 with SMTP id 38so3012674iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 00:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=j+iAr3BjUaIEt9haOxmnH30uZA0RpqrrSx//NTVCJ3M=;
	b=xTtrwE0EbycH2GsyrN5NErLxs0W5pidtog+Neqs0we2IYHRV0AQuuBQ2VHPdg/ImtH
	5iqPTaMM9J48LnzHiVXPonS+VdJcHrQAaItY1YzF2f8+KC/069GVVvyWoCDMrbYrhwXs
	wiZVurT3cEDKlf835O6JE2ost8Yzl8KQJpa8g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LZQIEoQQnAuJuH2nJiiauE5teNm/yL8GqWN2b9M1zAMPpTBGxo4zRTEcjAVcSUcbxJ
	545vwBJwTQshhGPX8d2NhpyC0kNlAmgtEpIONB75JxWG22J6I1XWvF61OHPmWe1CNyks
	pweHd+xPvhcFWfTmuGWJYB1MMWH9ybOtVTtIc=
MIME-Version: 1.0
Received: by 10.231.35.194 with SMTP id q2mr6604410ibd.26.1290416203300; Mon,
	22 Nov 2010 00:56:43 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Mon, 22 Nov 2010 00:56:42 -0800 (PST)
In-Reply-To: <4CEA2BFF.5090707@sensortherm.de>
References: <4CE64779.3020802@sensortherm.de>
	<AANLkTinAj4fG48Ppz_jwT1nmp+tzntZ9YJPaqat4HbES@mail.gmail.com>
	<4CE7D1F2.7010305@sensortherm.de>
	<AANLkTi=VB3EJo1DU2pGWgCSqFrZX81t1Es4xTHP3eCWU@mail.gmail.com>
	<4CEA2BFF.5090707@sensortherm.de>
Date: Mon, 22 Nov 2010 09:56:42 +0100
Message-ID: <AANLkTimabe75SmdGTA5EemH83-4Yd7KjNwdx8D3dCNR6@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: buildserver
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
X-List-Received-Date: Mon, 22 Nov 2010 08:57:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/22 Klaus Schwarzkopf <schwarzkopf@sensortherm.de>:
> Am 21.11.2010 19:08, schrieb Chris Larson:
>>
>> On Sat, Nov 20, 2010 at 6:49 AM, Klaus Schwarzkopf<
>> schwarzkopf@sensortherm.de> =A0wrote:
>>
>>>
>>> =A0Other good idea is to have sanity checker running once per day too. =
It
>>>>
>>>> may do next things:
>>>> - check recipes syntax
>>>> - check thath recipes SRC_URI can be fetched
>>>>
>>>
>>> I think, bitbake can easily integrate this two features.
>>>
>>> For example the new options:
>>>
>>> --download-only =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 only download the sourc=
e files for the
>>> given recipe
>>>
>>> --download-only-with-depencies =A0only download the source files for th=
e
>>> given recipe and its depencies
>>>
>>> --check-syntax =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0check recipes syntax
>>
>>
>>
>> This seems pretty foolish and unnecessary to me. =A0This can be easily d=
one
>> in
>> the metadata -- there's no need to modify bitbake for this at all.
>
>
> Hi Chris,
>
> you are right! I don't see this function.
>
> I wrote some commands, to download the source files:
>
>
> export MACHINE=3Ddm355-evm # can be for all machines
>
> find /home/klaus/development/oe/openembedded/ -name '*.bb' -type f -exec
> =A0bitbake =A0-c fetch -b '{}' =A02>&1 > fetch.log \;
>
> egrep -n 'ERROR.*bb..failed' fetch.log
>
>
> It is not perfect, but it shows some errors.
>
> Can somebody test it?

You can also do
bitbake -c fetchall world (although this has a little bit less
coverage as it will not handle older versions).

I'm not too good in find syntax so instead of your find cmd I would
probably use something like:

for i in recipes/*/*bb
do
bitbake -c fetch $i
done > fetch.log 2>&1

Enjoy! Frans


