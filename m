Received: from [74.125.46.154] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M3fhT-0000yu-3G
	for openembedded-devel@openembedded.org; Tue, 12 May 2009 02:18:27 +0200
Received: by yw-out-1718.google.com with SMTP id 5so1701093ywm.30
	for <openembedded-devel@openembedded.org>;
	Mon, 11 May 2009 17:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type; bh=cmEyul5Kmnkz/5HEWXwQzzE7DySNafhT/OSFhCFfxyU=;
	b=WfmiH0wdXWN2IAJsUVj4tH9O7LYnPVe9ZvPeE/0erA7eAX8F+OmfbHTlomiHTJ2HUj
	21lYrvUn1qqCsIJpKWdLNCLlSis2yyv3vJOGoiu1MxFQEi3+D9HpSg362r+qxOdAsMwk
	luGVZMnoCgAThZHhNe4b+ePTrln1/fWhE3T/Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	b=aQRn1hjcJZnArfxpgK7LDMSIOkz+9F5ANzSXmEF5JCDrIRwerLaL5tYYGcfOyxJ3M5
	9IMMdbsvgSHfHUvFAkKlmSqudDudGEI3oAmE/5pA6LpxJrAll5/fKCNNOOfj6Ib3nuE9
	uDixN62VnFXYfD1vTFRCwQOE0+0ZDZmsRp1bM=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.140.15 with SMTP id n15mr12396053and.105.1242087109346; 
	Mon, 11 May 2009 17:11:49 -0700 (PDT)
In-Reply-To: <1242081458.5824.37.camel@ted>
References: <4A07EE70.2010408@gmx.net>
	<200905111619.42187.marcin@juszkiewicz.com.pl>
	<1242081458.5824.37.camel@ted>
Date: Mon, 11 May 2009 21:11:49 -0300
X-Google-Sender-Auth: 0042bfdbe7dd7218
Message-ID: <be7a9f3d0905111711r77d0230eif76b4551d3f05c2c@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: python 2.6 warning
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
X-List-Received-Date: Tue, 12 May 2009 00:18:27 -0000
X-Groupsio-MsgNum: 10175
Content-Type: multipart/mixed; boundary=0016e64355deefa3010469abf057

--0016e64355deefa3010469abf057
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Richard,

On Mon, May 11, 2009 at 7:37 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> I've backported it to bitbake 1.8 and it seems to work along with
> merging a number of fixes lurking in Poky.

Please push the attached fix too.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br

--0016e64355deefa3010469abf057
Content-Type: text/x-diff; name="proper-skip-regext.diff"
Content-Disposition: attachment; filename="proper-skip-regext.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fulul8d90

SW5kZXg6IGxpYi9iYi9wcm92aWRlcnMucHkKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0gbGliL2JiL3Byb3ZpZGVy
cy5weQkocmV2aXPDo28gMTE3OCkKKysrIGxpYi9iYi9wcm92aWRlcnMucHkJKGPDs3BpYSBkZSB0
cmFiYWxobykKQEAgLTI5Nyw5ICsyOTcsOCBAQAogCiAgICAgIyBPbmx5IHNlYXJjaCBkeW5hbWlj
IHBhY2thZ2VzIGlmIHdlIGNhbid0IGZpbmQgYW55dGhpbmcgaW4gb3RoZXIgdmFyaWFibGVzCiAg
ICAgZm9yIHBhdHRlcm4gaW4gZGF0YUNhY2hlLnBhY2thZ2VzX2R5bmFtaWM6Ci0gICAgICAgIHBh
dHRlcm4gPSBwYXR0ZXJuLnJlcGxhY2UoJysnLCAiXCsiKQogICAgICAgICB0cnk6Ci0gICAgICAg
ICAgICByZWdleHAgPSByZS5jb21waWxlKHBhdHRlcm4pCisgICAgICAgICAgICByZWdleHAgPSBy
ZS5jb21waWxlKHBhdHRlcm4ucmVwbGFjZSgnKycsICJcKyIpKQogICAgICAgICBleGNlcHQ6CiAg
ICAgICAgICAgICBiYi5tc2cuZXJyb3IoYmIubXNnLmRvbWFpbi5Qcm92aWRlciwgIkVycm9yIHBh
cnNpbmcgcmUgZXhwcmVzc2lvbjogJXMiICUgcGF0dGVybikKICAgICAgICAgICAgIHJhaXNlCg==

--0016e64355deefa3010469abf057--
