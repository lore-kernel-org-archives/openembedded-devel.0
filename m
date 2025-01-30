Return-Path: <jinyi_2001@foxmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52355C02193
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 01:35:46 +0000 (UTC)
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.47])
 by mx.groups.io with SMTP id smtpd.web11.6418.1738200937702860044
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 17:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foxmail.com header.s=s201512 header.b=ltEoGTUa;
 spf=pass (domain: foxmail.com, ip: 43.163.128.47, mailfrom: jinyi_2001@foxmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1738200933;
	bh=KKUzdp48ITt1oNZUC5z5LgB8ex8L36lX+UXG15LrFBI=;
	h=From:To:Subject:Date;
	b=ltEoGTUauJUMHXzJidKmxJoazPS9YlhflT8KTwr5D38KPsVrLo1SheBns87fHJSPJ
	 4Pgv5m40tSYfT4n+euCQFuxg6O8DIrBbNtOZaqJUZ4UVhiRNH0CjPPQC1ufDqnK05T
	 cNvt8LQTiUKBU1JDYn/I6Hflq6MVjAQ1I0zAE03k=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-XMAILINFO: Mt9BMxL1UY78nKwRbUXivKlV46sXkW8Pax+2+ynfu83C4jrHEn2eM0O7sYAjck
	 OAt+sGj4jrFErKh8CpK2bmlSTLSlhMRebmeI1fFa3TuX6PXlUFMSDe/2ADfQdgTgA0Xx5asgopotz
	 AQqgFJrOnfn+2jkehJb7HrPEGf1/DHX1nuUnL9PAj2+X5ehaWUZfNuXfSQg0mwcAqXvcE2VSYmBIE
	 hk5/+qOfJfusJAQhsOWe1OSLN8lQ+svNWthBMopbHTkO2EEZJmhB2sqlTDLT6/BJK/ca70yTeDp2C
	 gVPit2K6xXkAe3VLbq/tPDtl26roY5r+icUATuFcl0zqnQX33LkBiY9V4jXI9u556Goa7oHHEOkpj
	 4NBT1T7f+8pZDmxteUyDgMxfmc9Bko0Sn7Czqw2qGaN/TC70wX9hpIXGyxCpi0NHQ+Nw8msxMkQsn
	 L7yixHVhS9SFci1mVl7GkQLVr5YNcg7q/n+D+rDebgdz6NT0y2B7usexrj/2TS0BN7BsLito0TeeO
	 7jkUXTUPhRsLOt4UXtaFQkpiYILXvZmgBXYT1vtIVbRqqpqq/yJZdkGOXRMtRkHU2Kok5+/kRkgo6
	 r/l5gwZlW/VHFSnN+xsut1gj2Sz2UGaNGvm08kvCIdJxq6C6t/X0VZl1E6Gb1i4wcrPJdHsQAjcVp
	 39PV4RzHEPdY2pw3PBpunZI9tB8hFkS1Lu8tqDYcvQYXjGfPasJE+nhbl2/3DDWFx2cY6qA/EvlQt
	 ll/OMfEBdDKbsmLHf6LdbpxiezCOevVAFO4D0+NWsDS+PPKqn7JV3njHwbcxnxgI/jwoktkEaVSrE
	 GM/ltmw2ygJx8IwN6LXeMtDMipEoW6SJ/dladefWQWMVz1JXOAcoA9cxNfo2+TEWmVeoJmAS5UKiv
	 HVQG55CTT7JA/1ODy7+OGIMGQziCku2NbXsZpYsHDJJ/hK/jkUq+3BwZifPU/alKn5CL7Hqu4CBBN
	 NbRPUK8Q==
From: "=?utf-8?B?SmluIFlp?=" <jinyi_2001@foxmail.com>
To: "=?utf-8?B?b3BlbmVtYmVkZGVkLWRldmVs?=" <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] Fix: Handle relative paths in replacements to avoid potential bugs.
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Date: Thu, 30 Jan 2025 09:35:32 +0800
X-Priority: 3
Message-ID: <tencent_F61C6EBBF68B713B4E901652BF8CF74E7208@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-mid: xmsezb20-1t1738200932t2qqp0meg
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 01:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115143

RnJvbSZuYnNwO2YzNmQzNTk3NjRiNDFlMGMwYmYzNGExMjY1MmEwNmIzMjVkYTM3YTYmbmJz
cDtNb24mbmJzcDtTZXAmbmJzcDsxNyZuYnNwOzAwOjAwOjAwJm5ic3A7MjAwMTxici8+RnJv
bTombmJzcDsmcXVvdDtZaS5KaW4mcXVvdDsmbmJzcDsmbHQ7amlueWlfMjAwMUBmb3htYWls
LmNvbSZndDs8YnIvPkRhdGU6Jm5ic3A7V2VkLCZuYnNwOzI5Jm5ic3A7SmFuJm5ic3A7MjAy
NSZuYnNwOzIzOjAzOjQ2Jm5ic3A7KzA4MDA8YnIvPlN1YmplY3Q6Jm5ic3A7W1BBVENIXSZu
YnNwO1NpZ25lZC1vZmYtYnk6Jm5ic3A7WWkuSmluJm5ic3A7Jmx0O2ppbnlpXzIwMDFAZm94
bWFpbC5jb20mZ3Q7PGJyLz48YnIvPkZpeDombmJzcDtIYW5kbGUmbmJzcDtyZWxhdGl2ZSZu
YnNwO3BhdGhzJm5ic3A7aW4mbmJzcDtyZXBsYWNlbWVudHMmbmJzcDt0byZuYnNwO2F2b2lk
Jm5ic3A7cG90ZW50aWFsJm5ic3A7YnVncy48YnIvPi0tLTxici8+Jm5ic3A7c2NyaXB0cy9n
aXQmbmJzcDt8Jm5ic3A7NCZuYnNwOysrKy08YnIvPiZuYnNwOzEmbmJzcDtmaWxlJm5ic3A7
Y2hhbmdlZCwmbmJzcDszJm5ic3A7aW5zZXJ0aW9ucygrKSwmbmJzcDsxJm5ic3A7ZGVsZXRp
b24oLSk8YnIvPjxici8+ZGlmZiZuYnNwOy0tZ2l0Jm5ic3A7YS9zY3JpcHRzL2dpdCZuYnNw
O2Ivc2NyaXB0cy9naXQ8YnIvPmluZGV4Jm5ic3A7Njg5YWRiZjlkZC4uNjNhZGZkMDg0ZSZu
YnNwOzEwMDc1NTxici8+LS0tJm5ic3A7YS9zY3JpcHRzL2dpdDxici8+KysrJm5ic3A7Yi9z
Y3JpcHRzL2dpdDxici8+QEAmbmJzcDstMTYsNyZuYnNwOysxNiw5Jm5ic3A7QEAmbmJzcDtv
cy5lbnZpcm9uWyYjMzk7UFNFVURPX1VOTE9BRCYjMzk7XSZuYnNwOz0mbmJzcDsmIzM5OzEm
IzM5Ozxici8+Jm5ic3A7cGF0aCZuYnNwOz0mbmJzcDtvcy5lbnZpcm9uWyYjMzk7UEFUSCYj
Mzk7XTxici8+Jm5ic3A7IyZuYnNwO3dlJm5ic3A7bmVlZCZuYnNwO3RvJm5ic3A7cmVtb3Zl
Jm5ic3A7b3VyJm5ic3A7cGF0aCZuYnNwO2J1dCZuYnNwO2Fsc28mbmJzcDthbnkmbmJzcDtv
dGhlciZuYnNwO2NvcHkmbmJzcDtvZiZuYnNwO3RoaXMmbmJzcDtzY3JpcHQmbmJzcDt3aGlj
aDxici8+Jm5ic3A7IyZuYnNwO21heSZuYnNwO2JlJm5ic3A7cHJlc2VudCwmbmJzcDtlLmcu
Jm5ic3A7ZVNESy48YnIvPi1yZXBsYWNlbWVudHMmbmJzcDs9Jm5ic3A7W29zLnBhdGguZGly
bmFtZShzeXMuYXJndlswXSldPGJyLz4rc2NyaXB0X3BhdGgmbmJzcDs9Jm5ic3A7b3MucGF0
aC5hYnNwYXRoKHN5cy5hcmd2WzBdKTxici8+K3NjcmlwdF9wYXRoJm5ic3A7PSZuYnNwO29z
LnBhdGguZGlybmFtZShzY3JpcHRfcGF0aCk8YnIvPityZXBsYWNlbWVudHMmbmJzcDs9Jm5i
c3A7W3NjcmlwdF9wYXRoXTxici8+Jm5ic3A7Zm9yJm5ic3A7cCZuYnNwO2luJm5ic3A7cGF0
aC5zcGxpdCgmcXVvdDs6JnF1b3Q7KTo8YnIvPiZuYnNwO8KgJm5ic3A7wqAmbmJzcDtpZiZu
YnNwO3AuZW5kc3dpdGgoJnF1b3Q7L3NjcmlwdHMmcXVvdDspOjxici8+Jm5ic3A7wqAmbmJz
cDvCoCZuYnNwO8KgJm5ic3A7wqAmbmJzcDtyZXBsYWNlbWVudHMuYXBwZW5kKHApPGJyLz48
YnIvPg==


