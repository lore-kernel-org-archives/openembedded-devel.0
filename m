Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OsWKx-0008Le-0C
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 09:42:18 +0200
Received: by ywa8 with SMTP id 8so1626596ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 00:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=fJnf5mJkBbJdAOtrpklG41Dl98m71c+URXOQyQKf0DE=;
	b=RrG/pH2PGBQCdn/w8n0ggLbKOiRkgPXL0B9DEcr+Nx3ixe0TXaCBc3wr1dBuE5LMrj
	CDbp6xxHDkBbM6KnnGngYm1UReo25hWNWW5JvwCNKNbnRvEUrn6yCxwSMi7gjO0xK/e9
	tUu9QhMLjfzOxyNHoWy46KKTrMmQ55kmUmy1I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VksiqYO1o4OPVqF7FeBrVnQtpb0dq0+sL5ypo53HsfG+ZDkzfS9q3cQSTcStVoL+ui
	6pO1x1D4iYkaWg28Yhuoz4Q6NuATzzw4MYDLZDsmlTjKgsZz7ExQAnhDVE+K9aNvIoay
	fHDQldunOx6lcy9+Ayf+w8E4j6URuXq5GVWbE=
MIME-Version: 1.0
Received: by 10.90.115.9 with SMTP id n9mr678185agc.137.1283758874798; Mon, 06
	Sep 2010 00:41:14 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 6 Sep 2010 00:41:14 -0700 (PDT)
In-Reply-To: <20100906035002.GB5320@gmail.com>
References: <AANLkTimxWVes3DZQPGn53BZ1cL6BSX5BT3hwgFHrCUA4@mail.gmail.com>
	<AANLkTinBzdnAYv_0O=vXnaJ5VNj56Th74eZ=naVSFcFB@mail.gmail.com>
	<AANLkTikSBQOi6aC0W8QzfEOk6skMcBmbaJdmE4K+Auwd@mail.gmail.com>
	<20100906035002.GB5320@gmail.com>
Date: Mon, 6 Sep 2010 09:41:14 +0200
Message-ID: <AANLkTinvnAhcr63sm=O+s+iyZw8tKfspjzhR__XOb5mU@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: virtclass_install prepend
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
X-List-Received-Date: Mon, 06 Sep 2010 07:42:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/6 Khem Raj <raj.khem@gmail.com>:
> On (19/08/10 21:14), Frans Meulenbroeks wrote:
>> 2010/8/19 Chris Larson <clarson@kergoth.com>:
>> > On Thu, Aug 19, 2010 at 4:29 AM, Frans Meulenbroeks <
>> > fransmeulenbroeks@gmail.com> wrote:
>> >
>> >> Hi,
>> >>
>> >> Found this in our reicpes:
>> >>
>> >> dbus/dbus-glib_0.86.bb:do_install_virtclass-native_prepend() {
>> >>
>> >
>> > This prepends to do_install_virtclass-native, which will then replace
>> > do_install when the overrides are applied. =A0This is prepending to a =
variable
>> > which overrides, as opposed to the other, which is a conditional prepe=
nd.
>> > =A0The two are quite different. =A0It's unlikely that this is what the=
y
>> > intended. =A0Far more likely that it should be changed to
>> > _prepend_virtclass-native.
>>
>> I have no idea what is intended and I have no dbus knowledge, so can't f=
ix this.
>> I'll leave it to someone else to resolve this.
>
> I think the correct fix is as Chris suggested. Please go ahead and fix it=
.
>

Well I am a little bit hesitating as I am by no means an expert on the
dbus recipe.

The other question that immediately popped up is:
If the code is wrong and no-one noticed, is it actually needed?

The code is:
do_install_virtclass-native_prepend() {
        install -d ${D}${datadir}/dbus
        install -m 0644 dbus-bus-introspect.xml ${D}${datadir}/dbus
}

Actually if the standard do_install needs to be changed, it generally
raises some alarms with me.
Why would we need to install something that the package normally does
not install?
(of course this could be a bug in the package, but then I would prefer
a patch that we also try to push upstream).

Frans.


