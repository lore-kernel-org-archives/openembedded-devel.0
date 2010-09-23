Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Oyu9m-0001Vx-8Q
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 00:22:39 +0200
Received: by iwn2 with SMTP id 2so1813045iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 15:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=E3FxhgNkDONEG6MW9xmZFDnNN0ouVYtEUfZ1Bws0VlI=;
	b=grI+eJByeypCjnRlW1EFn3LT6fVE+dHXxKrNN3THlApNIB9jkmtjzytnphlOJBQA0w
	IT14V9I1IrBa0l3ATETvTOLkxJ9LASIVkRHazhqtHlQrML9Ehv4LxMb3Dw0rj5FRo6lJ
	McTY3pBgJ1p2fTJXxKs3DvCtUYQ06/L1ezasQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OFKEBcM317Y54ZusK7ypxXe3jYFzpOVPA46W22tzPK7Z1YxRy4iQVdqjrWhZ4vdHhN
	aB/Bp1ZQFbW3K/ZGXLCI4IvTC6msS+yxfASELbwXkGO9hcUs/M1xvG0rpQVO8FjV8KoW
	75iKjv0C44gTb1xWjz3TOogLN0UfH5IYj783Q=
MIME-Version: 1.0
Received: by 10.231.11.4 with SMTP id r4mr2697912ibr.66.1285280262263; Thu, 23
	Sep 2010 15:17:42 -0700 (PDT)
Received: by 10.231.158.147 with HTTP; Thu, 23 Sep 2010 15:17:42 -0700 (PDT)
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F080310E154E8@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F080310E154E8@dlee06.ent.ti.com>
Date: Fri, 24 Sep 2010 07:47:42 +0930
Message-ID: <AANLkTi=45dASvU5XiCia4o2bia-Zx38neVw8vK6Qvrx-@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question about automake licensing in recipe
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
X-List-Received-Date: Thu, 23 Sep 2010 22:22:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 24 September 2010 05:44, Maupin, Chase <chase.maupin@ti.com> wrote:
> All,
>
> I was digging around in the automake sources and I noticed that there is =
a top-level COPYING file that says automake is licensed under GPLv2. =A0How=
ever, in the lib directory there is another COPYING file that says GPLv3. =
=A0I was trying to figure out what LICENSE should be set to for automake wh=
en the sources contain both GPLv2 and GPLv3 code. =A0Should it be set to so=
mething like GPLv2/GPLv3? =A0I've read that GPLv2 and GPLv3 are incompatibl=
e (http://gplv3.fsf.org/wiki/index.php/Compatible_licenses#GPLv3-incompatib=
le_licenses) so can a recipe even be marked as being both GPLv2 and GPLv3?
>
> Any input would be appreciated here.

If the GPLv2 has the "or later version" clause and you are combining
with GPLv3, then there is no incompatibility as the entire thing is
then distributed under the GPLv3. If there is no "or later" clause,
then its a problem that needs to be sorted out upstream.

-Graham


