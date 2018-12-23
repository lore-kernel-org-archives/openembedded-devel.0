Return-Path: <code@reto-schneider.ch>
X-Greylist: delayed 922 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 23 Dec 2018 16:22:11 UTC
Received: from mxout013.mail.hostpoint.ch (mxout013.mail.hostpoint.ch
	[217.26.49.173])
	by mail.openembedded.org (Postfix) with ESMTP id D352D6BD1B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2018 16:22:11 +0000 (UTC)
Received: from [10.0.2.46] (helo=asmtp013.mail.hostpoint.ch)
	by mxout013.mail.hostpoint.ch with esmtp (Exim 4.91 (FreeBSD))
	(envelope-from <code@reto-schneider.ch>) id 1gb6HB-000K8h-Vb
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2018 17:06:49 +0100
Received: from 91.226.197.178.dynamic.wless.zhbmb00p-cgnat.res.cust.swisscom.ch
	([178.197.226.91] helo=[192.168.43.179])
	by asmtp013.mail.hostpoint.ch with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.91 (FreeBSD))
	(envelope-from <code@reto-schneider.ch>) id 1gb6HB-0000rD-NY
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2018 17:06:49 +0100
X-Authenticated-Sender-Id: reto-schneider@reto-schneider.ch
From: Reto Schneider <code@reto-schneider.ch>
To: openembedded-devel@lists.openembedded.org
References: <1545553483-17422-1-git-send-email-ankit.tarot@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=code@reto-schneider.ch; prefer-encrypt=mutual; keydata=
	mQQNBFsB1/YBIADXrl4TUpcENRJRyGbJF0uB1KDY3vFvNC6HZVGMSKMHrUcHZqg6pBlhs9qX
	diKgrz5QeRckhEYOxf45UW7UVOLWNmhRWwZcVlbcib/iDWgL7rPDfnlhSdXQiBaongsmcVtY
	fg+lHkIpRCv0AXrSJTylF1YXA5mxsn6/WzsBnG07qRXMYbcIaXUrr55ENzEFkdizuIgBFwi6
	HCbkNrLVRzYU+glNHG3KNbfxusdQnTJY4uOdEq+i0TLy09IgLm2wtmQtJ4HK13kYVvmP7OqP
	umxCG5MoHwtfaGfaL6JmtrucLY3d6hrodEAZLatF1+FOKK/SLH3s/WvNhINbrkZ7i8jECBfi
	hdL5VarKiILRsJtOaZ3T36ayMlWYmdjYfVShQ5mc4D2h2B73Ur4YrcIIdP13PIw9JKDEeGJl
	V3qCsR7k4SRXeBT+Mo1g/MRoJgF7EwM5vC9F2laKXRd/OK7dUakz03SpmeMUhGQqVqUKGBcF
	1Ay+7lAypAcSFbWyQDegC+Bt6VBxqM+iiTQmizbavina5xX1oB9woGsagtIyYX3IkL1fTVbJ
	jGPnjOA/byk2ZvuoI+RI4HzVc8tDZGC9N8pCf3BY7wGJDpRSf42Tvf2lqzJW0CnndZtHjtF1
	iM38fEyjH29tGy7o66rgQAzdEZCLj7u5qbI2kbVBI4YMYsGaYGVx1MqmuQBXKeTfAz+NAndA
	Fean5TV8J1iO4RmAhvsDBqLx3M8MEt0/Zbn2xEGF8hNYIfGdAl2BbGevXNPbqVU55H7mCN4u
	UBaC+q8FV7CkcFctFXhQPI7aNrUSlWO4sVHC+0BfoJN/t4k5f7B24GXJmHM+GOkDL/hcLFlq
	l6g6vpefd4nx3I1hmK4a6n/lchpD/MNr/nZ2wtzs6y4xHccNmPEC2noYw8ei2ZryqNhgSdl/
	+BbwXevFs2jKSoL9Xhpf4mjahKmmX9/R4+nP8ptFOrEYWZ3hL5r7xtPFHivoCs5xhIQaqsjk
	3+Y/jmT9iGixS+7o2w8zk9pkk6KSRyiWmWSgMNEeLjV9677pehVm6UstOZZBqv6seA3ZMale
	pwDnW7nUnseyxWMJKmjhVd5iGn9UYKmfrxtVh8T7n+k9zGSW5Pohzkj1kO39/QsMb9PJFeX4
	EP0BKzeniC4v9+dVxeNEKR82RJzoCsyREL5n706NgHWY7uZkC8LVnc6gC+VoySsNSmRchcAf
	kAfGVibe2XcjK9PzZtiz7p1TN4657aefooDr4Dr8frDZaWJ3hGEjF7P9bvsmvhZlLtCPFwp+
	PonD5n60us520bnEAQosl4TUpY1h6zrZl6nnln6ytc98tlv5rTRJRKpRb9hiR/cj++/EBtle
	V12r+S1f7dmXABEBAAG0J1JldG8gU2NobmVpZGVyIDxyZXRvQHJldG8tc2NobmVpZGVyLmNo
	PokEVgQTAQoAQBYhBIWKyNwBtfKAt0IXmJ0JCpFbe4vRBQJbAdf2AhsvBQkDwmcACAsJDQgM
	BwsKBRUKCQgLBBYDAgECHgECF4AACgkQnQkKkVt7i9EuDR/+JjmFIpB1SN+RWAPNepGhiuLR
	f1sduZzs9020eG4cKo2kFalIuObyShIFe7gg/YtgD7cS/T9n8ZbMP+EPkgyB2c0uv36/Drzd
	iOlmwFtfwJTzvR81EtU2YPrGulv58Uv1zm+C3XjsidRuFXl+Ng891pY3Ht1eP/L4/RIgd1T4
	YAZ6PM0L/hco4CzixqbAyRSQ7EwZRTTRk2lIqul126VEBcruN+WOA0q28KnFWWEwoua0E1pP
	VcAWrdXR8OVO7R/iFpVc1MVA1BkfNdq6EgSNvKCM5Va/F6+3af2mZ5pOnx0RsepAmlGragG7
	0TUu29t78nYN1kqnccCkuuaD/GH9kG2QFsrtKhRzGeJDHJgIP0m2MRQtmwQpuie/cVvEkD/B
	H0fRV0VoAK9299BsvwGP9iDbbE4EzHiyh2o0MfUKqjHBFfee+BQ8lKFwLOatGMAan9Lv8bwF
	aH0bvxd+yc01Qr7Xianly1KsFhn0I/qUx22hMR82IB1qSmF45F1eF5gtAKwTr9rqT1LpuME9
	+AJdzVe6xRp1doBC7M8WIqMOXHJLaBxAD0fskUUwITlRauvIYG2Mdnl3qrIGI7R1zQ2HlubS
	40/StzQ52eejM3z430PACx2JKF/tDnuVLlsET5AxUs1ExkxNciDesJZTwWHt08bWdZ0Rw/zy
	Zy+xMEr7yaeWt1Qg/9JXkpIFK6nd8UqKl2lc511uBQWuMbgV5OcxKsL4SOf/xYc2/OxiOXpg
	i/Is9FwebbKH2pMlmRs7WjVd4IukuPLXrFKWDe9XoHwMzXcpP+I4eb95F2Df1Cl+AbXI0APq
	cxA7kY3CSUV3IC9hvid8AynFD2MPUFE538USHm3ZGh1VQb/XCWjMQFofLbE9d1Mx3padCMNg
	XHkUrP13XKgZUCBGsoyF2uZLoWuN+LjJoXHyw1SjnPJ8DNU2G1i9ZCmSsT6Q2snnR/rV2Tl/
	iqddMnBm3G8pA2ImO4rkYlI0GcgoaheQq+9Sx81jJC//xBWBfFOsdZXP3rq5h1uuxce9J27M
	ElmuZUZ2S3iLZY2iBjlF3nF9yYIU0gH2n6JA55B1ErK4IZYufI9085cZNcc21XsKevbMzj8I
	Zj8WHA3q7muNo9O/nCh/G+jFcwc9BYrTeg871BLIG6+lnjpJuOmxEh1sv6eED4+5o356JEG+
	tJNb8dZkOFgu98qCo5QhdtxoZL/4gauwY/0dVsCpo0liRkHrmWmVXvVZj0g16jur7Dz//7J7
	ysEmf0W6Nzkkp9KDBNewOHdzkr5DLOY6Aef58K7lDJw6OzFQU5iKpyVvoL5Y83fHF7B/9cpH
	HtZxFMKCr+zi0LAq09iXlNhj8g5A6/hobcuq9G6/Fhhv8LkEDQRbAdf2ASAA3omHX4BU+s3W
	5gf8XIctI6PeN8QDVXMUciHggNil9WwazMLwlfIDypsRRgrgDlkXctHGiPGUD0ud+r++MmDa
	f6exVjkH2T/ZujZux9Or35sfHOW1WIIteftrpLhbCmlNysgJiKu1HDqv/UoWmev1+Y/0POy8
	3NE/JySs7hziD/ltMPALLXzJv2vYyBg4GjlLUdGPNP9hpGPzUYVo/T+YmriiowWAnuAJkh5N
	U+O7VD20fllqWuTfx/c839om1QAg1xmFqF//VXovaYHF2AWLNImxY3y697Zga1r0XdMldinu
	BkupF0v4EdNGfrF68nREc5oI2cYLRfd6ZsT40Pr63G0NdbXqMMjLFh5AnzBLMf15KWalF9MY
	cYvCJQruOUheT5hDE8J/pypJDKZQRKgJP/6mm5hfWBFz2t4i02Pv2KA/6AoQ1f3g/uRtn4u2
	Tra0415C53K44/vUxMXqwifzJOSPUmX4fZYVFlxLXxQMn7pxP5VGekVCY3b5Fpy9DlmtaK4P
	NVpP31nYYjeseFijV1Jq039HWew0FTXTNu1ewJT/ZHwXTLB/kvRpAFQa3vMPidlTUYMULYLU
	goOX8NrIXtowI5DlSOl4QlMr4yAy/40wudwKSg1WJvGfEThRcocCobzzwEjLqMwAz4NTTZcL
	Il96i3oVpNI4aAjXZewi3YIdwqSm7aLYNhnJBfhjIDLqilskuNU2aTJFwPu/6AtrM6Ox0rvo
	JoO3e23LYKHTC8706OtGh9Hyb7R8JTn3rxWDvRd/AezWPdmErIcYZ4rlafivCXMKyuKnxzrk
	cGkhkVSU2o/VMqhwPm2iSgnyQMyv7dA+g0rzFQ0hJG93xNBVFVX2fwtyrry/UK1BOZBX7eIc
	m02IYUBllGm8hOlxWYtaZIzAQ6CuLSOUnKxeMiN+CQKvSS2h57LwdMVqB4xvzMkyt0CAF3bj
	6G/Q87gOqo35aBeFFXfVcBm0S6sffDpHg1FKYppBnn2CMdqxK4q2JMVQ71Ma8RrbPm3S99h/
	vGQEzg+qmoy5gGoZps0nUhJ4qq94rA1SWT0cXFYMa+e19Mffk1zV86gl5tOBaO0lkbK7zmyS
	A5+mzVQ5WdvQmI8v33yGXFe3BV0xFGBSC8MsUIOhSVZM0jA5Wh+wTvXsfDuF2mzWlDQPfqWL
	57pMNpvodHZ33WxP6Uut96XyU+t4W9yEM0z9qwGqPmnnj9YPxS1nC/RxJyAX8rcQ/wQbbE9J
	/zBSTVSmDsnb39ocb+9MDvrJBv2S4A4N2F49qVPKS8PjtL+S/dgcb3NHmO4Kvifwx28g9Udv
	YkNJ7bZRYgZeT6i9GkhEqqXT8Oc+m8fMomlLjn2PdHVgKUQDdlQFD9Fp6wARAQABiQhyBBgB
	CgAmFiEEhYrI3AG18oC3QheYnQkKkVt7i9EFAlsB1/YCGy4FCQPCZwAEQAkQnQkKkVt7i9HD
	dCAEGQEKAB0WIQQd2oni3BFGS/3xsT+du4lmobEmvQUCWwHX9gAKCRCdu4lmobEmvQjmH/9m
	IsQLGcXy4hb/UgcH7MfyPQfYG+TGtS4Ih5olTxjsI4AIegZvdTshp6lpQZ6AzMYjUa97ejJ8
	0NJzfIO0n0XOaDjOh11Dxt5sqZCyz/6N5VN63MjFkyP+TkADNO6sfEKI7yxz119Ksg0H/I3A
	htJR+l+AovxHFUh7+1/g0Hcc/oXIeSgqaZVfs8lfwKpAaRXPobZXLF96Dh6xbalbMZG/sSA0
	ZdfSMO55kf06QGREw0YjAjI7jbk82JXeyETvCr8wYlM2c4qTPyBJnTrs95nwb8MqiroYnu46
	3OzIf7gEzbjzMlA4nLfDfVKz0bYNFZjikX8edl+4LOXSBo0+lr+6Er1fuoXSp05eQYxAGUUW
	XLYmDVczosneEYp+HREABCwfkpumuxoVBMD1Pjw3mEpNxt6KqLUBh8LHhWzM5n3FAa4aAg3A
	WogOm3WDyh9+OlDdDTznUHYy6Pwik7XPRchr2faioSz2CF0c54J3dx8xDxlLHe2025nGN4uq
	NNNL7GmHXrRc+pBkyMOSCgpcXRLUqHrdECvkRrNRaIEDYKk9lLrbmWOTUtTuztiDLWa8Fnq7
	KFfXhsscbb4g09zRm9m3ky6AOFBK3kxOtLkLYPT/kFuxdBL7Bag1HonQuFiPI1Q5agJSkSvG
	z42RopyM82Kx0WDaaxoAhuuWP/UjGSatlkXFH14AbqAKIaZD35FZyP7WAhK24dpmOGsBfQcc
	eBHLPIg28hKubjhZOxFNMuQEGTwzxvrAFoS6DU1YnPlUH7p23dw9Z8cM3UrbFdFclTd9KeTz
	7Pr5efolrwca75oJTLtL5Eo9F6csPaS1aFHJ8jp0bHXrW7PGDbpevsCZjGzRwXnimeWjEAE5
	dFFcfpJ/A4wy3HyjBVI2gplK2c00FjeJpNP6x81YN4CiZR0b/riny5g4yHcIzwFl49YZsVgJ
	dv/Wp3KVLC9DgPYw/lOwTu8lQL8PNm7XGLJLJQLOvWqFpXdcUR9js38lA8yG2ch3GwLfZsAE
	q6F1h8fHM/JRKqZSlsSqDABuIBqSaCJzZd5oSu4c+nz7WG1C2f/J2HUA/dmWc3h85JJSQg0M
	UjSKPETIB4BRPOoz0Q94HmkHu41m0+JP4092NfBBMnSAHiKdhuUO3wT627iEkgIaYKGMZW1m
	YL3ywYyaE7aISjq/esCXeQsEKCHYcgvH/OF5dkBk/VE2OnkpUZdCadSD8CgvasyQJCs3hG2A
	1DLOGSrhGdjaw4arSeaPbjugDqaDSfnJZqTPDVfzUD10TnCdyi0+Aes5KIzaDAyaWioId6TD
	vGCKcQxKgrVVDbJRxZ51ImAfxVV6XWWjS9X5+t6oMI6cvJLPPRAl9IQe+KEbrQIYHGm7pnwg
	AMbahiZG17wtd3fJJpLs1ayES2nE2VSeJ/qpBCVMx85fF1GWfdb+GzK8YxFt0CmG5Lp1D+k6
	1COkdyBkOJJDfjarvPsA1SCz8KZUR/IMiGSYD5qU6NXlksje1L4lYp/hCi6zHLuNodZkV4wl
	Q6bnZjcXdHQlADnZd1CHZi/+ZOdV4cz7obQyBBG6mqwwmLBTxwRrY2W1qFkIMo+Qfi5acGZS
	WO75uFFCIOhesGy/MMLu7OCTKaVw0oDd/OJMjhVsbSDhysmJCxeM8a1Fo/KtKgcxdVKn79F9
	6ty0OVcYzBSvXsJhHpC52EMs/u4uxsq8vCT/FNW+tpVhcTdwx5vTdVdlkyGh5xJ+w824Xwo5
	fudLcQE5tDJ489yORRv7ltoIe3TSvbET5HG7t2esHSlN+SGgA8jiBDURS3WYwtoOYUqCWtou
	/4RuUGs6bteYm/qk5eJ9CmJKrdln8QujDtswo/DFpQ8JDEIAVNu6fxjh0NzYgu66YH/A4IPd
	ZP7Ejkf9J0QebH9kHixZr4jZrDxNSWoAl8EwElZL6GJuAnY2FeU3r+5rJJOZ2zPKEKrRG0lX
	Z5HPHTEARu7SR6z1KrkdMtpOJGtC30GFbVABI2bIAfinHtXOgttvVZVvUrzyhk7KX0KIzzwi
	8sVfDAFtAZKwR48+U9GeAEKZecYpAu36Z8movXNz3mNaL5h/Bec1bYi+USvBVml13+Y51ot0
	nHe6Czi6KfTjbEKNeB7su20OopZvRyW9e9z3N3WFiyYboqGBhlLK+kibZZhfSAJ5/hBX//z5
	hrUJbV5oAtW2fQy0oVktfrVb1D+RxSXn5sn1w9PAYnCr9r+ivuJIjN/2qE+p0pvja6Tq5cZS
	RHMKg/lI71JnquIp8/LL12qYlYDDEePouFs6G3f50fe8TzrVKAUmTA7+GdEUlhjQeXIrJ26j
	eBPBqpAyBHViYuHBZ5q5/Hsunmn6wO+bsLey9E2Hlo0JgG8tm/kUTBduay4DuNPiRHuiq78J
	BAncxiEz/yL7115n0Nc/P98a7+gAsoBpiMEYcptaDmVG9BNOJqevpHC5V2c4bTe0YsdQobQS
	1SRzsfO7HghfmJmDM305/g7YF9j/9cBoN3HU3eK61ZT/HszgHqtuI/w8rw4yll3+ZiGtiZnP
	LBf6Zgaii9cj9wbHc3wG8SC5+uURdGsEj2F7+mIJTs77YAEyj4niQ1Zt000D2IiNbfbXyuiJ
	bomM/6gGq1Zs/fVXq4dxvmfUYVcrfNdH7+j01F9qwDbxCx5YqOUtm60rkf/lrLN9GJIAR4Do
	qB+e/Z8yu2Xqg2mqthVVc4nb8UnmOIHT5xQnUhfJvBdmpNeizGgIqfpGceTSqiBv/Y8t+qc=
Message-ID: <2ae1112d-2917-dca0-4656-aa692dce6e27@reto-schneider.ch>
Date: Sun, 23 Dec 2018 17:06:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1545553483-17422-1-git-send-email-ankit.tarot@gmail.com>
Subject: Re: [PATCH] wifi-test-suite: Initial recipe for wifi test suite.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Dec 2018 16:22:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/23/18 9:24 AM, Ankit Navik wrote:
> Add generic recipe for wifi test suite from wifi alliance.
> Suite is to support certification program development and device certification.

I did pretty much the same a few weeks ago [1] for a MIPS/musl based IoT
gateway [2] (DUT).

What I learned:
 - You will need some patches for the makefiles [3]
 - When using musl, you will need something like this (parts of it) [4] too
 - If you are using the Busybox utils, those scripts will not work an
need to be adapted. Our Testhouse did do this for us, so I do not know
exactly what changes where needed.

> +do_compile () {
> +	oe_runmake
> +}

Pretty sure this is not needed. My recipe at least does have this.

> +do_install () {
> +	install -d ${D}${libdir}
> +	install -m 0644 ${S}/lib/libwfa.a ${D}${libdir}
> +	install -m 0644 ${S}/lib/libwfa_ca.a ${D}${libdir}
> +	install -m 0644 ${S}/lib/libwfa_dut.a ${D}${libdir}

I do not think that you need the static libraries.

> +	install -d ${D}${sbindir}
> +	install -m 0755 ${S}/dut/wfa_dut ${D}${sbindir}
> +	install -m 0755 ${S}/ca/wfa_ca ${D}${sbindir}
> +	install -m 0755 ${S}/WTGService/WTG ${D}${sbindir}
> +	install -m 0755 ${S}/console_src/wfa_con ${D}${sbindir}
> +# Test scripts
> +	install -m 0644 ${S}/scripts/getipconfig.sh ${D}${sbindir} # Must copy

They have hard coded the path to this script [5][6]. You will need to
fix the installation location or their C code.

> +	install -m 0644 ${S}/scripts/arp_neigh_loop ${D}${sbindir}
> +	install -m 0644 ${S}/scripts/dev_send_frame ${D}${sbindir}
> +	install -m 0644 ${S}/scripts/findprocess.sh ${D}${sbindir}
> +	install -m 0644 ${S}/scripts/getpid.sh ${D}${sbindir}
> +	install -m 0644 ${S}/scripts/getpstats.sh ${D}${sbindir}
> +	install -m 0644 ${S}/scripts/gpstats.sh ${D}${sbindir}
> +	install -m 0644 ${S}/scripts/sta_reset_parm ${D}${sbindir}
> +	install -m 0644 ${S}/scripts/stoping.sh ${D}${sbindir}
> +	install -m 0644 ${S}/scripts/updatepid.sh ${D}${sbindir}
> +	install -m 0644 ${S}/scripts/wfaping6.sh ${D}${sbindir}
> +	install -m 0644 ${S}/scripts/wfaping.sh ${D}${sbindir}
> +	install -m 0644 ${S}/scripts/wfa_test_cli.sh ${D}${sbindir}
> +}

How about "install -m 0755 -D ${S}/scripts/*.sh ${D}${bindir}" for the
scripts?

[1]
https://github.com/husqvarnagroup/smart-garden-gateway-yocto-meta-gardena/blob/master/recipes-wifi-alliance/wifi-testsuite/wifi-testsuite_git.bb
[2] https://github.com/husqvarnagroup/smart-garden-gateway-public
[3] https://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT/pull/42
[4]
https://github.com/husqvarnagroup/smart-garden-gateway-wifi-alliance-test-suite/compare/eb2799fbc28a2e5b309e2e85d0fa0b8e9cd0d100...master
[5]
https://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT/blob/master/lib/wfa_cs.c#L322
[6]
https://github.com/Wi-FiTestSuite/Wi-FiTestSuite-Linux-DUT/blob/master/lib/wfa_cs.c#L2118



