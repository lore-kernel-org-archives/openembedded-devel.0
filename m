Received: from [74.125.46.158] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1LptGa-0001ZH-BD
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Apr 2009 01:57:46 +0200
Received: by yw-out-1718.google.com with SMTP id 9so944583ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Apr 2009 16:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=A7U337huqZDVEVK9X3Xd+DobbikNe37vTkWo+u3BMwE=;
	b=oD1xJ6kFZUfcftcOSBB0LzWOk8jueFT3UppcvahxUKn8QoZ1isj7CIzsgrarQUD16L
	jxUyl39a0BKKhxkKIX/ufqI2/gL0mjmxdW6D23XYEwoULN3PuxHUniz7pM0oSDcADtzi
	xuZUc/aSkkgxgF+J+lfkM7DiPSlC/8TQ+/7eA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=uEjwRiOpihHGG0evDqw0mwPGCSIA+j7iU/hZHSXTTEP4By+HXVCU1OKry/57LbLhyr
	Rvrs9eF8Pi7v4KPSMsj1y1F2we4rwGRjqhOBS6KyLVr9ww+mR52B30E16hsE1fT+R44T
	y9ExVyQLI47H8hQqWnO5R43NyZ0N//JxXBDAo=
MIME-Version: 1.0
Received: by 10.100.137.12 with SMTP id k12mr3956310and.55.1238802909963; Fri, 
	03 Apr 2009 16:55:09 -0700 (PDT)
In-Reply-To: <200904031951.12061.marcin@juszkiewicz.com.pl>
References: <200903311837.28324.marcin@juszkiewicz.com.pl>
	<200904021325.22988.marcin@juszkiewicz.com.pl>
	<d2b9ea600904030918s2f45debak2f76d45022fbe850@mail.gmail.com>
	<200904031951.12061.marcin@juszkiewicz.com.pl>
Date: Sat, 4 Apr 2009 01:55:09 +0200
Message-ID: <d2b9ea600904031655t4b069034p732eba57c9f5e0f5@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.46.158
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_40,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE] branch created: stable/2009
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
X-List-Received-Date: Fri, 03 Apr 2009 23:57:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/4/3 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:

> sanity.conf sets one variable: BB_MIN_VERSION = "1.8.12" and this is
> checked on start of each build. We bump that only when BitBake is
> released and if change is really required.

Ok.

Would it be a sane solution to them simply use the BitBake version specified
in BB_MIN_VERSION, or do the "if change is really required" mean that
it sometimes
makes good sense to use a newer version?

If so, it would be nice to have something like BB_RECOMMENDED_VERSION

Also, is the BB_MIN_VERSION defined so it will/must always be a tagged
version of bitbake?

/Esben


