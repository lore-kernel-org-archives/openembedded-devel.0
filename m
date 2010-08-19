Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Om3JJ-00086N-8y
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 13:29:29 +0200
Received: by iwn38 with SMTP id 38so1721897iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 04:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=4nzyyAcYf80PnCCb1ChCn+dB8yLNhQMxlF0KyQpMriA=;
	b=jRC+KVYTW2Fb1q/TuMyT3WFyO9OmszsYHLTs/D9hZXwh7uXXOb/uXatE1d8ZSq9qjv
	1JWPiZV/1//zCvsnmFXjRJQiabheGCn4ssd+pT7PfOrbxNPsgP4HVV9q5ZlIANYwNSd+
	9KTEvZORErUTp/nWlpw/3KfJiWfRHPiCoA0xQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=O15ut96DI1te07qs86nk/9JPw7p5qvavtYmlJ+pV5VVgTU+7xpDxy69ZmJa5hGyXSV
	MNZTVCFoIyh7qPaPKtg0gDV/N9TsKUAhJdH2DtmL5UMtVOTTyLCOcPESu9TKkCjjERhI
	IAkxvQcTf8QbRsqEDxm/81mS8BdN2AFowUs6I=
MIME-Version: 1.0
Received: by 10.231.148.195 with SMTP id q3mr10949816ibv.199.1282217341031;
	Thu, 19 Aug 2010 04:29:01 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Thu, 19 Aug 2010 04:29:00 -0700 (PDT)
Date: Thu, 19 Aug 2010 13:29:00 +0200
Message-ID: <AANLkTimxWVes3DZQPGn53BZ1cL6BSX5BT3hwgFHrCUA4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: virtclass_install prepend
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
X-List-Received-Date: Thu, 19 Aug 2010 11:29:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Found this in our reicpes:

dbus/dbus-glib_0.86.bb:do_install_virtclass-native_prepend() {
postfix/postfix.inc:do_install_prepend_virtclass-native() {

Who is right wrt the position of _prepend ?

Or are both ok ? (and if so are there any differences? )

Frans


